
## toolz

[Source](https://toolz.readthedocs.io/en/latest/api.html#toolz.functoolz.pipe)

### Itertoolz
accumulate(binop, seq[, initial])	Repeatedly apply binary function to a sequence, accumulating results
concat(seqs)	Concatenate zero or more iterables, any of which may be infinite.
concatv(*seqs)	Variadic version of concat
cons(el, seq)	Add el to beginning of (possibly infinite) sequence seq.
count(seq)	Count the number of items in seq
diff(*seqs, **kwargs)	Return those items that differ between sequences
drop(n, seq)	The sequence following the first n elements
first(seq)	The first element in a sequence
frequencies(seq)	Find number of occurrences of each value in seq
get(ind, seq[, default])	Get element in a sequence or dict
groupby(key, seq)	Group a collection by a key function
interleave(seqs)	Interleave a sequence of sequences
interpose(el, seq)	Introduce element between each pair of elements in seq
isdistinct(seq)	All values in sequence are distinct
isiterable(x)	Is x iterable?
iterate(func, x)	Repeatedly apply a function func onto an original input
join(leftkey, leftseq, rightkey, rightseq[, …])	Join two sequences on common attributes
last(seq)	The last element in a sequence
mapcat(func, seqs)	Apply func to each sequence in seqs, concatenating results.
merge_sorted(*seqs, **kwargs)	Merge and sort a collection of sorted collections
nth(n, seq)	The nth element in a sequence
partition(n, seq[, pad])	Partition sequence into tuples of length n
partition_all(n, seq)	Partition all elements of sequence into tuples of length at most n
peek(seq)	Retrieve the next element of a sequence
pluck(ind, seqs[, default])	plucks an element or several elements from each item in a sequence.
random_sample(prob, seq[, random_state])	Return elements from a sequence with probability of prob
reduceby(key, binop, seq[, init])	Perform a simultaneous groupby and reduction
remove(predicate, seq)	Return those items of sequence for which predicate(item) is False
second(seq)	The second element in a sequence
sliding_window(n, seq)	A sequence of overlapping subsequences
tail(n, seq)	The last n elements of a sequence
take(n, seq)	The first n elements of a sequence
take_nth(n, seq)	Every nth item in seq
topk(k, seq[, key])	Find the k largest elements of a sequence
unique(seq[, key])	Return only unique elements of a sequence
countby(key, seq)	Count elements of a collection by a key function
partitionby(func, seq)	Partition a sequence according to a function

### Functoolz
complement(func)	Convert a predicate function to its logical complement.
compose(*funcs)	Compose functions to operate in series.
curry(*args, **kwargs)	Curry a callable function
do(func, x)	Runs func on x, returns x
excepts(exc, func[, handler])	A wrapper around a function to catch exceptions and dispatch to a handler.
flip	Call the function call with the arguments flipped
identity(x)	Identity function.
juxt(*funcs)	Creates a function that calls several functions with the same arguments
memoize	Cache a function’s result for speedy future evaluation
pipe(data, *funcs)	Pipe a value through a sequence of functions
thread_first(val, *forms)	Thread value through a sequence of functions/forms
thread_last(val, *forms)	Thread value through a sequence of functions/forms

### Dicttoolz

assoc(d, key, value[, factory])	Return a new dict with new key value pair
dissoc(d, *keys)	Return a new dict with the given key(s) removed.
assoc_in(d, keys, value[, factory])	Return a new dict with new, potentially nested, key value pair
get_in(keys, coll[, default, no_default])	Returns coll[i0][i1]…[iX] where [i0, i1, …, iX]==keys.
keyfilter(predicate, d[, factory])	Filter items in dictionary by key
keymap(func, d[, factory])	Apply function to keys of dictionary
itemfilter(predicate, d[, factory])	Filter items in dictionary by item
itemmap(func, d[, factory])	Apply function to items of dictionary
merge(*dicts, **kwargs)	Merge a collection of dictionaries
merge_with(func, *dicts, **kwargs)	Merge dictionaries and apply function to combined values
update_in(d, keys, func[, default, factory])	Update value in a (potentially) nested dictionary
valfilter(predicate, d[, factory])	Filter items in dictionary by value
valmap(func, d[, factory])	Apply function to values of dictionary

### Sandbox

parallel.fold(binop, seq[, default, map, …])	Reduce without guarantee of ordered reduction.
core.EqualityHashKey(key, item)	Create a hash key that uses equality comparisons between items.
core.unzip(seq)	Inverse of zip