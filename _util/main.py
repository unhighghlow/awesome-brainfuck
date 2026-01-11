import os
import shutil
from dataclasses import dataclass, field
from enum import Enum
from html import escape
import re
import json

class FuncKind(Enum):
    Interpreter = "Interpreter"
    Compiler = "Compiler"
    JITCompiler = "JIT Compiler"
    def to_json(self):
        return self.value

@dataclass
class IntrFunc:
    kind: FuncKind
    comp_targets: list[str] | None = field(default=None)
    def to_json(self):
        out = {"kind": self.kind.to_json()}
        if self.kind == FuncKind.Compiler:
            out["targets"] = self.comp_targets
        return out

@dataclass
class Interpreter:
    name: str
    links: list[str]
    description: str
    functions: list[IntrFunc]
    language: str
    author: str
    year: int
    id: str
    def to_json(self):
        return {"name": self.name, "links": self.links, "description": self.description, "functions": [i.to_json() for i in self.functions], "language": self.language, "author": self.author, "year": self.year, "id": self.id}


def parse_functions(func_str):
    if not func_str:
        print("Warning: empty functions")
        return func_str

    func_parts_raw = [i.strip() for i in func_str.split(",")]
    func_parts = []
    for i in func_parts_raw:
        if i.startswith("Interpreter") \
        or i.startswith("Compiler") \
        or i.startswith("JIT Compiler"):
            func_parts.append(i)
        else:
            if not func_parts:
                raise ValueError(repr(func_str))
            func_parts[-1] += ", "+i

    return list(map(parse_func_part, func_parts))

def parse_func_part(func_part):
    if func_part == "Interpreter":
        return IntrFunc(FuncKind.Interpreter)
    if func_part == "JIT Compiler":
        return IntrFunc(FuncKind.JITCompiler)
    if func_part.startswith("Compiler to "):
        func_part = func_part[12:]
        targets_raw = [i.strip() for i in func_part.split(",")]
        targets = []
        for i in targets_raw:
            targets += [j.strip() for j in i.split(" and ")]
        return IntrFunc(FuncKind.Compiler, targets)

    raise ValueError(func_part)

def parse_name_link(name_link):
    LINK = re.compile(r"^\[(.*?)\]\((.*?)\)")
    IGNORE = re.compile(r"^\[\^.*\]$")
    orig = name_link

    name = None
    links = []
    while name_link:
        if IGNORE.match(name_link):
            break
        
        match = LINK.match(name_link)
        if match is None:
            raise ValueError(repr(orig), name_link)
        name_link = name_link[len(match.group(0)):]
        name_link = name_link.strip()
        if name is None: name = match.group(1)
        links.append(match.group(2))

    return name, links

def parse_id(id_raw):
    if not id_raw:
        return ""
    if not id_raw.startswith("`") or not id_raw.endswith("`"):
        raise ValueError(repr(id_raw))
    return id_raw[1:-1]

def read_table():
    BEGIN = "<!-- BEGIN TABLE !-->"
    END = "<!-- END TABLE !-->"

    with open("README.md") as f:
        contents = f.read()

    found_begin = False
    found_end = False
    table_lines = []
    for line in contents.split("\n"):
        if line == END:
            found_end = True
        if found_begin and not found_end:
            table_lines.append(line)
        if line == BEGIN:
            found_begin = True

    table_lines = table_lines[3:-1]
    table_data = []

    for line in table_lines:
        if line.startswith("|"): line = line[1:]
        if line.endswith("|"): line = line[:-1]

        name_link, description, func_str, \
        language, author, year, id_raw \
          = [i.strip() for i in line.split("|")]

        name, links = parse_name_link(name_link)
        functions = parse_functions(func_str)
        id = parse_id(id_raw)

        table_data.append(Interpreter(
            name = name,
            links = links,
            description = description,
            functions = functions,
            language = language,
            author = author,
            year = int(year),
            id = id
        ))
    return table_data

def generate_functions(functions: list[IntrFunc]):
    funcs = []
    for func in functions:
        if func.kind == FuncKind.Interpreter:
            funcs.append("Interpreter")
        elif func.kind == FuncKind.JITCompiler:
            funcs.append("JIT Compiler")
        elif func.kind == FuncKind.Compiler:
            s = ""
            for i, target in enumerate(reversed(func.comp_targets)):
                if i == 1:
                    s = " and " + s
                elif i > 1:
                    s = ", " + s
                s = target + s
            funcs.append(f"Compiler to {s}")
    return "; ".join(funcs)

def generate_name_link(name: str, links: list[str]):
    out_links = [
        f"<a href={escape(l, True)}>{"alt" if i else name}</a>"
        for i, l in enumerate(links)
    ]
    return " ".join(out_links)

def generate_base(table_data: list[Interpreter]):
    out = "<table><tr><th>Name</th><th>Description</th><th>Type</th><th>Language</th><th>Author</th><th>Year</th><th>Run</th></tr>"

    for i in table_data:
        out += "<tr>"
        out += "<td>" + generate_name_link(i.name, i.links) + "</td>"
        out += "<td>" + escape(i.description) + "</td>"
        out += "<td>" + generate_functions(i.functions) + "</td>"
        out += "<td>" + escape(i.language) + "</td>"
        out += "<td>" + escape(i.author) + "</td>"
        out += "<td>" + str(i.year) + "</td>"
        out += "<td>" + escape(i.id) + "</td>"
        out += "</tr>"

    out += "</table>"
    return out

def generate_page(table_data):
    initial_table = generate_base(table_data)

    filedir = os.path.dirname(__file__)
    with open(os.path.join(filedir, "index.html")) as f:
        page = f.read()

    table_data_json = [i.to_json() for i in table_data]

    page = page.replace("INITIALTABLE", initial_table)
    page = page.replace("TABLEDATA", json.dumps(table_data_json))
    return page

if __name__ == "__main__":
    d = read_table() 
    page = generate_page(d)

    os.makedirs("out", exist_ok=True)
    with open("out/index.html", "w") as f:
        f.write(page)

    filedir = os.path.dirname(__file__)
    shutil.copy(os.path.join(filedir, "index.js"), "out")
