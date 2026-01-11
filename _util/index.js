const HEADERS = ["name", "description", "functions", "language", "author", "year", "id"];
const UP_ARROW = "\u25B2";
const DOWN_ARROW = "\u25BC";

let data = null;
let started = false;
let filter = null;
let sorting = null;

function clear_table() {
  let tbody_elem = document.getElementsByTagName("table").item(0).children.item(0);
  let heading = tbody_elem.children.item(0);

  tbody_elem.innerHTML = "";
  tbody_elem.appendChild(heading);
}

function start() {
  if (started) return;
  started = true;

  let data_elem = document.getElementById("data");
  data = JSON.parse(data_elem.innerText);

  let header_elems = document.getElementsByTagName("th");
  for (const ind in HEADERS) {
    header_elems.item(ind).style.textDecoration = "underline";
    header_elems.item(ind).addEventListener(
      "click",
      function () {
        toggle_sorting(HEADERS[ind])
      }
    );
  }
}

function toggle_sorting(attribute) {
  let direction = "asc";
  if (sorting !== null
   && sorting.attribute == attribute
   && sorting.direction == "asc") {
    direction = "dec";
  }

  sorting = {
    attribute: attribute,
    direction: direction
  };
  render_table();
}

function render_table_dom(table_data) {
  return table_data.map(render_interpreter);
}

function render_interpreter(row) {
  let row_elem = document.createElement("tr");
  row_elem.appendChild(render_name(row.name, row.links))
  row_elem.appendChild(render_string(row.description))
  row_elem.appendChild(render_functions(row.functions))
  row_elem.appendChild(render_string(row.language))
  row_elem.appendChild(render_string(row.author))
  row_elem.appendChild(render_string(row.year))
  row_elem.appendChild(render_string(row.id))

  return row_elem
}

function render_string(str) {
  let cell_elem = document.createElement("td");
  cell_elem.innerText = str;
  return cell_elem;
}

function render_name(name, links) {
  let cell_elem = document.createElement("td");
  for (const ind in links) {
    let link = links[ind];
    let link_elem = document.createElement("a");
    if (ind == 0) {
      link_elem.innerText = name;
    } else {
      link_elem.innerText = "alt";
      let space = document.createTextNode(" ");
      cell_elem.appendChild(space);
    }
    link_elem.href = link;
    cell_elem.appendChild(link_elem)
  }
  return cell_elem;
}

function render_functions(funcs) {
  let cell_elem = document.createElement("td");
  for (const ind in funcs) {
    if (ind > 0) {
      cell_elem.innerText += "; ";
    }
    cell_elem.innerText += render_function(funcs[ind]);
  }
  return cell_elem;
}

function render_function(func) {
  if (func.kind == "Interpreter") return func.kind
  if (func.kind == "JIT Compiler") return func.kind

  let out = "Compiler to ";
  for (const ind in func.targets) {
    if (ind == 0) {}
    else if (ind < func.targets.length - 1) {
      out += ", ";
    } else {
      out += " and ";
    }
    out += func.targets[ind];
  }
  return out;
}

function function_sorting_key(func) {
  if (func.kind == "Interpreter") {
    return 0;
  } else if (func.kind == "JIT Compiler") {
    return 1;
  } else {
    return func.targets.length+1;
  }
}

function functions_sorting_key(functions) {
  let max = 0;
  for (const f of functions) {
    let a = function_sorting_key(f);
    if (a > max) {
      max = a;
    }
  }
  return max+(functions.length/10);
}

function sort_by(data, sorting) {
  if (sorting === null) return;
  data.sort(
    (a, b) => {
      let key_a = null;
      let key_b = null;
      if (["name", "description", "language", "author"].includes(sorting.attribute)) {
        key_a = a[sorting.attribute].toLowerCase();
        key_b = b[sorting.attribute].toLowerCase();
      } else if (sorting.attribute == "functions") {
        key_a = functions_sorting_key(a.functions);
        key_b = functions_sorting_key(b.functions);
      } else if (sorting.attribute == "id") {
        key_a = a[sorting.attribute];
        if (key_a == "" && sorting.direction == "asc") {
          key_a = Infinity;
        }
        key_b = b[sorting.attribute];
        if (key_b == "" && sorting.direction == "asc") {
          key_b = Infinity;
        }
      } else {
        key_a = a[sorting.attribute];
        key_b = b[sorting.attribute];
      }
      
      let out;
      if (key_a > key_b) {
        out = 1;
      } else if (key_b > key_a) {
        out = -1;
      } else {
        out = 0;
      }
      if (sorting.direction == "dec") {
        out = -out;
      }
      return out;
    }
  );
}


function render_arrows() {
  let ind = 0;
  for (const elem of Array.from(document.getElementsByTagName("th"))) {
    if (elem.innerText.endsWith(UP_ARROW)
      ||elem.innerText.endsWith(DOWN_ARROW)) {
      elem.innerText = elem.innerText.slice(0, elem.innerText.length-1);
    }
    if (sorting !== null) {
      if (sorting.attribute == HEADERS[ind]) {
        let arrow;
        if (sorting.direction == "asc") {
          arrow = UP_ARROW;
        } else {
          arrow = DOWN_ARROW;
        }
        elem.innerText += arrow;
      }
    }
    ind++;
  }
}

function render_table() {
  let local_data = [...data];
  sort_by(local_data, sorting);
  
  let tbody_elem = document.getElementsByTagName("table").item(0).children.item(0);
  let new_table = render_table_dom(local_data);

  clear_table();
  for (const item of new_table) {
    tbody_elem.appendChild(item);
  }

  render_arrows();
}

document.addEventListener("DOMContentLoaded", start)
if (document.getElementById("data")) start();
