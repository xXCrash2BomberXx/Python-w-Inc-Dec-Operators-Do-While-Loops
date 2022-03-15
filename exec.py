from custom import parse

with open("program.py", "r") as f:
    var = parse(f.read(), e=True)
