---
title: "five ways to say \"Almost Always\" and actually mean it"
date: 2023-04-19
author: 'Yudhister Kumar'
desciption: ""
type: blog
keywords: ['math', 'funny']
---
## In English

A boring, colloquial way.

> "*Almost all the eggs are gone!" (as half a dozen remain)*

## Not-Finite-ness

A slightly-less-boring mathy way.

> "*Almost all prime numbers are odd!*"

There are infinitely many primes. There is exactly one even prime number (2). Infinity minus one is... infinity. 

> "*Almost all natural numbers are larger than one-hundred thousand quadrillion quadrillion vigintillion! (10^83)*"

There are infinitely many natural numbers. There are infinitely many natural numbers larger than one-hundred thousand quadrillion quadrillion vigintillion. No practical difference between 10^83 and 1 (other than that one is an upper bound on the number of atoms in the universe).

You formalize this with sets: if you have some (infinite) set, a subset whose complement has a finite cardinality encompasses almost everything in the set. We call this *cofiniteness.*

## Probability ~One

A way to quantify surety. 

> "*Almost all the people will lose money at the casino!*"

I'm not sure what the exact rates are, but I'd bet money on this being true.

> "*Almost all numbers are composite!*"

It is well known that the number of prime numbers below $N$ is approximately $N / \ln N$. In the limit as \\(N\\) goes to infinity, the ratio of primes to non-primes numbers goes to approximately zero. So if you choose a random positive integer, I would bet my life savings that it's composite.

> "*Almost all graphs are [asymmetric](https://en.wikipedia.org//wiki/Asymmetric_graph).*"

An intuitive explanation: if you take all possible combinations of nodes and vertices and let the number of each tend towards infinity, you should expect chaos to triumph over order. (sorry Ramsey). This does depend on a certain definition of symmetry, however, and a clearer statement would be "*almost all graphs have only one automorphism.*"

## The Lebesgue Measure is Not-Zero

A straightforward-yet-strange way for real numbers.

The [Lebesgue measure](https://en.wikipedia.org/wiki/Lebesgue_measure) is what you get when you try to generalize length, area, and volume to \\(n\\)-dimensions. It forms the basis for our current understanding of integration, and helps us  figure out how big stuff is. 

Something with zero volume basically doesn't exist anyway. 

> "*Almost all real numbers are irrational!*"

Well yes, all the rationals have measure zero. All countable sets have measure zero, and the rationals are countable. 

(Measures are nice: they're a neat generalization of physical scales (mass, volume, etc.) to arbitrary mathematical objects. They're particularly useful for dealing with continuous things ~~we love Lebesgue measures~~)

> "*Almost all real numbers are noncomputable!*"

Well yes? Of course an arbitrary real number can't be computed to arbitrary precision by a finite algorithm? [Computable numbers](https://en.wikipedia.org/wiki/Computable_number) are *countable,* remember? Nevermind that *basically all the numbers we deal with are computable,* this is *obvious.*

(Measure zero stuff basically doesn't exist, even if they're the only things we use on a daily basis)

> "*Almost all real numbers aren't in the Cantor set!*"

Well yes, of course! Even though the [Cantor set](https://en.wikipedia.org/wiki/Cantor_set) is uncountably infinite, it still has measure zero! It's a weird pseudo-fractal embedding of the real line that somehow manages to lose everything in translation but still keep all the relevant information.

(Idk, the Cantor set is weird)

## It is Contained in a Nonprincipal Ultrafilter

A *filter* $\mathcal{F}$ on an arbitrary set \\(I\\) is a collection of subsets of \\(I\\) that is closed under set intersections and supersets. (Note that this means that the smallest filter on \\(I\\) is \\(I\\) itself).

An *ultrafilter* is a filter which, for every $A \subseteq I$, contains either \\(A\\) or its complement. A *principal* ultrafilter contains a finite set. 

A *nonprincipal ultrafilter* does not.

This turns out to be an incredibly powerful mathematical tool, and can be used to generalize the concept of "almost all" to esoteric mathematical objects that might not have well-defined or intuitive properties. 

(One of the coolest uses of nonprincipal ultrafilters is in the construction of the hyperreals, post forthcoming).

Let \\(\mathcal{U}\\) be a nonprincipal ultrafilter over the natural numbers. It obviously contains no finite sets, but we run into a slight issue when we take the set
\\[
E = \\{2,4,6,8, \\ldots \\}
\\]
and its complement
\\[
O = \\{1,3,5,7, \\ldots \\}.
\\]
By the filter axioms, only one of these can be in \\(\mathcal{U}\\), and one of them *has* to be in \\(\mathcal{U}\\). And thus, we can safely say:

> "*Almost all natural numbers are **even**.*"






