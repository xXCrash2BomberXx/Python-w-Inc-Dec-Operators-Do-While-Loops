from re import finditer

def parse(string, e=True):
    while True:
        try:
            temp = string.index("do:")
            tabs = 0
            for i in range(string.index("do:")-1, 0, -1):
                if string[i] == " "*4:
                    tabs += 1
                else:
                    break
            temp = string[string.index("do:"):string[string.index("\n"+" "*4*tabs+"while")+len("\n"+" "*4*tabs+"while"):].index("\n")+string.index("\n"+" "*4*tabs+"while")+len("\n"+" "*4*tabs+"while")+1]
            char = list(filter(lambda i: i is not None, [char if temp[char] == "\n" else None for char in range(len(temp))]))[-1]+string.index(temp)
            string = string[:char]+":"+"\n"+" "*4*(tabs+2)+"break"+string[char:]
            string = string.replace("\n"+" "*4*tabs+"while", "\n"+" "*4*(tabs+1)+"if not", 1).replace("do:", "while True:", 1)
        except ValueError:
            break

    while True:
        try:
            temp = string[string.index("++")+2:string.index("++")+2+[m.start(0) for m in finditer(r'[^a-zA-Z0-9_]', string[string.index("++")+2:])][0]]
            if temp == "":
                temp = string[[m.start(0) for m in finditer(r'[^a-zA-Z0-9_]', string[:string.index("++")])][-1]+1:string.index("++")]
                if temp == "":
                    raise ValueError
                else:
                    copy = list(string)
                    copy.insert([m.start(0) for m in finditer(r'[^a-zA-Z0-9_]', string[:string.index("++")])][-1]+1, "((")
                    string = "".join(copy)
                    string = string.replace("++", ":=1+"+temp+")-1)", 1)
            else:
                copy = list(string)
                copy.insert(string[string.index("++"):].index(temp)+string.index("++")+len(temp), ")")
                string = "".join(copy)
                string = string.replace("++", "("+temp + ":=1+", 1)
        except ValueError:
            break

    while True:
        try:
            temp = string[string.index("--")+2:string.index("--")+2+[m.start(0) for m in finditer(r'[^a-zA-Z0-9_]', string[string.index("--")+2:])][0]]
            if temp == "":
                temp = string[[m.start(0) for m in finditer(r'[^a-zA-Z0-9_]', string[:string.index("--")])][-1]+1:string.index("--")]
                if temp == "":
                    raise ValueError
                else:
                    copy = list(string)
                    copy.insert([m.start(0) for m in finditer(r'[^a-zA-Z0-9_]', string[:string.index("--")])][-1]+1, "((")
                    string = "".join(copy)
                    string = string.replace("--", ":=-1+"+temp+")+1)", 1)
            else:
                copy = list(string)
                copy.insert(string[string.index("--"):].index(temp)+string.index("--")+len(temp), ")")
                string = "".join(copy)
                string = string.replace("--", "("+temp + ":=-1+", 1)
        except ValueError:
            break
    return exec(string) if e else string
