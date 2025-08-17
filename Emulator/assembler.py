srt_to_id_storage = {}
ram_output = [0]*0xffff

INST_TO_CODE = {
    "nop": 0,
    "ldi": 1,
    "mov": 2,
    "add": 3,
    "sub": 4,
    "mul": 5,
    "div": 6,
    "rem": 7,
    "and": 8,
    "not": 9,
    "or": 10,
    "xor": 11,
    "lsh": 12,
    "rsh": 13,
    "cmp": 14,
    "brh": 15,
    "bgt": 16,
    "beq": 17,
    "blt": 18,
    "bng": 19,
    "bne": 20,
    "bnl": 21,
    "biz": 22,
    "bnz": 23,
    "bc": 24,
    "bnc": 25,
    "call": 26,
    "addi": 28,
    "subi": 29,
    "muli": 30,
    "divi": 31,
    "andi": 32,
    "ori": 33,
    "xori": 34,
    "cmpi": 35,
    "bytw": 36,
    "wotb": 37,
    "ld": 38,
    "str": 39,
    "hlt": 40,
    "hz": 41,
    "hg": 42,
    "he": 43,
    "hl": 44,
    "cale": 46,
    "clne": 47,
    "calg": 48,
    "clng": 49,
    "cllt": 50,
    "clnl": 51,
    "calz": 52,
    "clnz": 53,
    "calc": 54,
    "clnc": 55,
    "inc": 56,
    "dec": 57,
    "smi": 58,
    "lmi": 59,
    "soi": 60
}


def read_files(paths: list[str]) -> list[dict]:
  files = []
  for path in paths:
    with open(path, 'rt') as file:
      content = file.read()
      processed_lines = []
      for line in content.split('\n'):
        line = line.split(';', 1)[0].strip()
        if line:
          processed_lines.append(line)

      before_subr = []
      subroutines = []
      current_subr = []
      in_subr = False

      for line in processed_lines:
        if line.startswith('srt '):
          in_subr = True
          if current_subr:
            subroutines.append('\n'.join(current_subr))
            current_subr = []
          current_subr.append(line)
        elif in_subr:
          current_subr.append(line)
          if line.startswith('ret'):
            in_subr = False
            subroutines.append('\n'.join(current_subr))
            current_subr = []
        else:
          before_subr.append(line)

      if current_subr:
        subroutines.append('\n'.join(current_subr))

      files.append({
        'no_subr_code': '\n'.join(before_subr),
        'subroutines': subroutines,
        'org': 0
      })
  return files

files = read_files(['OS\\bootloader.s', 'OS\\krnl.s'])

subr_count = 1
for f in files:
  f['no_subr_code'] = f['no_subr_code'].replace('\nret', '')
  for i, s in enumerate(f['subroutines']):
    srt_to_id_storage[s.split('\n')[0].split(' ')[1]] = subr_count
    f['subroutines'][i] = f['subroutines'][i].split('\n', 1)[1]
    f['subroutines'][i] = '\n'.join(f['subroutines'][i].splitlines()[:-1])
    subr_count += 1

  print("\n```")
  for l in f['no_subr_code'].split('\n'):
    l = l.split(' ')
    for i, tk in enumerate(l):
      try:
        int(tk, 16)
        if len(tk) == 2 and tk[0] == 'b':
          ...
        else:
          l[i] = int(tk, 16)
      except ValueError:
        pass
    if l[0] == 'org':
      f['org'] = l[1]
    if l[0] in INST_TO_CODE:
      l[0] = INST_TO_CODE[l[0]]
    
    print(l)
  print("```")

  for s in f['subroutines']:
    for i, l in enumerate(s.split('\n')):
      l = l.split(' ')
      for i, tk in enumerate(l):
        try:
          int(tk, 16)
          if len(tk) == 2 and tk[0] == 'b':
            ...
          else:
            l[i] = int(tk, 16)
        except ValueError:
          pass
      if l[0] == 'org':
        f['org'] = l[1]
      if l[0] in INST_TO_CODE:
        l[0] = INST_TO_CODE[l[0]]
      
      print(l)
    print("```")

subr_count = 1

print(srt_to_id_storage)