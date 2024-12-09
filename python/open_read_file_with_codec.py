import codec

lines = []
with codecs.open(path, 'r', encoding='utf8') as f:
    for line in f.readlines():
        if line.strip().lower().startswith('use') or ord(line.strip().lower()[0]) == 65279:
            continue
        lines.append(line)