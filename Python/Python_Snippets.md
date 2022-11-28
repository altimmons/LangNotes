#


## Generate a progress bar automatically

```py
from time import sleep
from tqdm import tqdm

for i in tqdm(range(1000))
    sleep(0.01)



    # for n in moves:

    import tqdm
for i in tqdm.trange(int(1e8), miniters=int(1e6), ascii=True,
                     desc="cool", dynamic_ncols=True):
    pass
# Nested bars
from tqdm import trange
for i in trange(10):
    for j in trange(int(1e7), leave=False, unit_scale=True):
        pass

# Manual Update
with tqdm(total=100) as pbar:
    for i in range(10):
        time.sleep(0.1)
        pbar.update(10)
```

## Iterate the file name:

```py
# Rename the file
if writeMethod == 1:
    i = 1
    #Remove the file ext
    fileext = args.output[-4:]
    args.output = args.output[:-4]

    #check if we alreaedy have xxxxx(#) as the file name. and remove
    if ( args.output.find('(') == ( len(args.output) - 3 ) ) and  ( args.output.find(')') == ( len(args.output) - 1 ) ):
        i = int(args.output[:-2]) + 1
        args.output = args.output[:-3]

    #
    args.output += ("(%d)" % (i))
    #loop unitl we get an unysed filename append value
    while exists(args.output):
        i += 1
        args.output = args.output[0:len(args.output) - 3]  + ("(%d)" % (i))
        
    #Add back the file extension
    args.output += fileext
```

##

def checkVer(desiredVer = 3):
    M, m = sys.version_info[0:2]
    #print(M, m)
    if(M != int(desiredVer)):
        raise VersionError(M, m, desiredVer)




## Parser


def launch():
    # parser = argparse.ArgumentParser(
    parser =  extendedParser(
        formatter_class=argparse.RawDescriptionHelpFormatter,
        description = '''
This program runs both the iterative and recursive solutions for the Towers of
Hanoi thought experiment.  There are several options available.   Minimally, 
the program should be provided with a value of [n].  


Additionally, the program expects a destination to save a file, marked by the
flag '-o'.  Lacking that, the program will print to the terminal.  You can force
printing to the terminal with the '-p' flag - in addition to the file.  


The '-r' flag gives a number of times to repeat the time measurement- for greater
accuracy.  High numbers are not really recommended here, but are permitted.


Finally, -h prints this message.
        ''',
        epilog = '''
To just run the time comparison, repeating each 5 times,  and show on the screen you 
would run- 
    'py main.py 4 -t -d -r 5'


To run the program, getting output to terminal and to a file 'output.txt' use: 
    'py main.py 5 -o output.txt -d'
        ''',
        prefix_chars="-/"
    )
    # for r in dd[args]:
    #     if datadict.
    #     parser.add_argument(r[short], r[long])
    # parser.add_argument("-n", "--number",
    parser.add_argument("n", #"--number",
        # nargs='?', # using this returns a list
        metavar='N', 
        type=int,
        choices = range(16), 
        # dest='n', 
        # default=,
        default=0,
        help="The number of disks to use."
        )
    parser.add_argument("-o", "--output", 
        type=str,
        metavar='FILENAME',
        default=None,
        # default="TOH-Output.txt",
        help="The location to save the file output.  If left blank, it will default to stdout"
    )

    parser.add_argument("-d", "--display", 
        action = 'store_true',
        default=False,
        help="Print output to the terminal (in addition to the file output."
    )

    parser.add_argument("-t", "--time",
        action = 'store_true',
        default = False,
        help="Just performm then timing test."
    )
    parser.add_argument("-r", "--repeat", 
        type=int,
        default=1,
        metavar="Repeat_Count",
        help="The number of times to repeat the measurement (for timing)."
    )
    parser.add_argument("-s", "--nostack", 
        action = 'store_false',
        default = True,
        help="Do not show the content of the stacks. Default=True"
    )
    parser.add_argument("-p", "--progress_off", 
        action = 'store_false',
        default = True,
        help="Do not show the progress bar."
    )

    # group = parser.add_mutually_exclusive_group()
    # parser.print_help() #takes arg of file --TODO add a file
    # parser.print_usage() #Redundant
    if len(sys.argv) == 1: #we didnt get any input
        # print(sys.argv[0])
        parser.print_help()
    else:
        args = parser.parse_args()
        # if args.number == None:
        #     parser.print_help()
        #     print('Heres')
        # else: 
        #   print(args.n)
        return args
    quit(0)
# def printSplash():
#     os.
