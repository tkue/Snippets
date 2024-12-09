try:
    print(1/0)
except Exception as e:
    raise type(e)('{}{}'.format(e, ' fail'))