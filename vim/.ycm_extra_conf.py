def FlagsForFile( filename, **kwargs ):
    ext = filename.split('.')[-1]
    if ext in ["cpp", "cc", "cxx"]:
        return {
            'flags': [ '-x', 'c++', '-std=c++11', '-Wall', '-Wextra', '-Werror' ],
        }
    else:
        return {
            'flags': [ '-x', 'c', '-Wall', '-Wextra', '-Werror' ],
        }
