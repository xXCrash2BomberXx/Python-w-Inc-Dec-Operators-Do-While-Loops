@echo off
echo from re import finditer > custom.py
echo def parse(string, e=True): >> custom.py
echo     while True: >> custom.py
echo         try: >> custom.py
echo             temp = string.index("do:") >> custom.py
echo             tabs = 0 >> custom.py
echo             for i in range(string.index("do:")-1, 0, -1): >> custom.py
echo                 if string[i] == " "*4: >> custom.py
echo                     tabs += 1 >> custom.py
echo                 else: >> custom.py
echo                     break >> custom.py
echo             temp = string[string.index("do:"):string[string.index("\n"+" "*4*tabs+"while")+len("\n"+" "*4*tabs+"while"):].index("\n")+string.index("\n"+" "*4*tabs+"while")+len("\n"+" "*4*tabs+"while")+1] >> custom.py
echo             char = list(filter(lambda i: i is not None, [char if temp[char] == "\n" else None for char in range(len(temp))]))[-1]+string.index(temp) >> custom.py
echo             string = string[:char]+":"+"\n"+" "*4*(tabs+2)+"break"+string[char:] >> custom.py
echo             string = string.replace("\n"+" "*4*tabs+"while", "\n"+" "*4*(tabs+1)+"if not", 1).replace("do:", "while True:", 1) >> custom.py
echo         except ValueError: >> custom.py
echo             break >> custom.py
echo     while True: >> custom.py
echo         try: >> custom.py
echo             temp = string[string.index("++")+2:string.index("++")+2+[m.start(0) for m in finditer(r'[^^a-zA-Z0-9_]', string[string.index("++")+2:])][0]] >> custom.py
echo             if temp == "": >> custom.py
echo                 temp = string[[m.start(0) for m in finditer(r'[^^a-zA-Z0-9_]', string[:string.index("++")])][-1]+1:string.index("++")] >> custom.py
echo                 if temp == "": >> custom.py
echo                     raise ValueError >> custom.py
echo                 else: >> custom.py
echo                     copy = list(string) >> custom.py
echo                     copy.insert([m.start(0) for m in finditer(r'[^^a-zA-Z0-9_]', string[:string.index("++")])][-1]+1, "((") >> custom.py
echo                     string = "".join(copy) >> custom.py
echo                     string = string.replace("++", ":=1+"+temp+")-1)", 1) >> custom.py
echo             else: >> custom.py
echo                 copy = list(string) >> custom.py
echo                 copy.insert(string[string.index("++"):].index(temp)+string.index("++")+len(temp), ")") >> custom.py
echo                 string = "".join(copy) >> custom.py
echo                 string = string.replace("++", "("+temp + ":=1+", 1) >> custom.py
echo         except ValueError: >> custom.py
echo             break >> custom.py
echo     while True: >> custom.py
echo         try: >> custom.py
echo             temp = string[string.index("--")+2:string.index("--")+2+[m.start(0) for m in finditer(r'[^^a-zA-Z0-9_]', string[string.index("--")+2:])][0]] >> custom.py
echo             if temp == "": >> custom.py
echo                 temp = string[[m.start(0) for m in finditer(r'[^^a-zA-Z0-9_]', string[:string.index("--")])][-1]+1:string.index("--")] >> custom.py
echo                 if temp == "": >> custom.py
echo                     raise ValueError >> custom.py
echo                 else: >> custom.py
echo                     copy = list(string) >> custom.py
echo                     copy.insert([m.start(0) for m in finditer(r'[^^a-zA-Z0-9_]', string[:string.index("--")])][-1]+1, "((") >> custom.py
echo                     string = "".join(copy) >> custom.py
echo                     string = string.replace("--", ":=-1+"+temp+")+1)", 1) >> custom.py
echo             else: >> custom.py
echo                 copy = list(string) >> custom.py
echo                 copy.insert(string[string.index("--"):].index(temp)+string.index("--")+len(temp), ")") >> custom.py
echo                 string = "".join(copy) >> custom.py
echo                 string = string.replace("--", "("+temp + ":=-1+", 1) >> custom.py
echo         except ValueError: >> custom.py
echo             break >> custom.py
echo     return exec(string) if e else string >> custom.py



echo from custom import parse > open.py
echo while True: >> open.py
echo         try: >> open.py
echo             total = "" >> open.py
echo             inp = input(">>> ") >> open.py
echo             total += inp+"\n" >> open.py
echo             while inp != "" and inp != "quit()": >> open.py
echo                 inp = input("... ") >> open.py
echo                 total += inp+"\n" >> open.py
echo             parse("\n"+total+"\n", e=True) >> open.py
echo         except Exception as e: >> open.py
echo             print(e) >> open.py


python open.py %1


del /f custom.py
del /f open.py