import subprocess
import itertools
import tempfile
import json 
import os
import sys
import time

os.chdir(os.path.dirname(__file__))

if not os.path.exists("deviceid"):
    print("ERROR: deviceid not found")
    print("write any string that can")
    print("identify the device to it")
    exit(1)

with open("deviceid", "r") as f:
    device_id = f.read().strip("\n")

print(f"Running benchmarks on {device_id!r}")

with open("config.json", "r") as f:
    config = json.load(f)

def run_cmds(cmds, env):
    for cmd in cmds:
        proc = subprocess.Popen(cmd, env=env, shell=True, stdout=sys.stdout, stderr=subprocess.PIPE)
        if proc.wait():
            out, err = proc.communicate(b'')
            print("\nERROR:")
            if out is not None:
                print(out.decode("utf-8"))
            if err is not None:
                print(err.decode("utf-8"))
            return 1
        print(".", end="", flush=True)

sources = []
for filename in os.listdir("programs"):
    if not filename.endswith(".b"): continue
    filepath = os.path.join("programs/", filename)
    sources.append((filename, filepath))

results = []
failed = 0

for name, cfg in config.items():
    print(f"== {name} ==")
    variants = cfg.get("variants", dict())
    v_vals = list(variants.values())
    v_keys = list(variants.keys())

    for variant_r in itertools.product(*v_vals):
        variant = {k: v for k,v in zip(v_keys, variant_r)}
        for k, v in variant.items():
            print(f"{k}: {v!r}")

        for filename, filepath in sources:
            with tempfile.TemporaryDirectory() as tmpdir:
                print(f"{filename}", end="", flush=True)
                env = os.environ
                env.update({
                        "src": filepath,
                        "scratch": tmpdir
                })
                env.update(variant)
                if "build" in cfg:
                    print(" Build", end="", flush=True)
                    build_start = time.perf_counter()
                    if run_cmds(cfg["build"], env):
                        failed += 1
                        continue
                    build_end = time.perf_counter()
                    build_time = (build_end - build_start)*1000
                else:
                    build_time = None
                print(" Run", end="", flush=True)
                run_start = time.perf_counter()
                if run_cmds(cfg["run"], env):
                    failed += 1
                    continue
                run_end = time.perf_counter()
                run_time = (run_end - run_start)*1000
                print()
                o = ""
                if build_time is not None:
                    o += f"build: {build_time:03.1f}ms "
                print(o+f"run: {run_time:03.1f}ms")
                results.append({
                    "runner": name,
                    "program": filename,
                    "variant": variant,
                    "times": {
                        "build": build_time,
                        "run": run_time
                    }
                })

os.makedirs("results", exist_ok=True)
with open(f"results/{device_id}.json", "w") as f:
    json.dump(results, f)

if failed:
    print(f"WARNING: {failed} targets failed")
