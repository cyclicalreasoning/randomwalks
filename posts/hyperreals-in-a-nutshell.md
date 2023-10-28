---
title: "Hyperreals in a Nutshell"
date: 2023-04-30
author: "Yudhister Kumar"
description: "The number system which begets nonstandard analysis (and nonstandard Peano arithmetic, but that's for another day)"
type: blog
keywords: ['math']
---
*Epistemic status: Vaguely confused and probably lacking a sufficient technical background to get all the terms right. Is very cool though, so I figured I'd write this.*

> And what are these Fluxions? The Velocities of evanescent Increments? And what are these same evanescent Increments? They are neither finite Quantities nor Quantities infinitely small, nor yet nothing. May we not call them the ghosts of departed quantities?
> 
> \- George Berkeley, *The Analyst*

When calculus was invented, it didn't make sense. Newton and Leibniz played fast and dirty with mathematical rigor to develop methods that arrived at the correct answers, but no one knew why. It took another one and a half centuries for Cauchy and Weierstrass develop analysis, and in the meantime people like Berkeley refused to accept the methods utilizing these "ghosts of departed quantities."

Cauchy's and Weierstrass's solution to the crisis of calculus was to define infinitesimals in terms of limits. In other words, to not describe the behavior of functions directly acting on infinitesimals, but rather to frame the the entire endeavour as studying the behaviors of certain operations in the limit, in that weird superposition of being arbitrarily close to something yet not it.

(And here I realize that math is better shown, not told)

The limit of a function \\(f(x)\\) at \\(x=a\\) is \\(L\\) if for any \\(\\epsilon>0\\) there exists some  \\(\\delta > 0\\) such that if
\\[ |x-a|<\\delta,\\]
then 
\\[|f(x)-L|<\\epsilon.\\]

Essentially, the limit exists if there's some value \\(\\delta\\) that forces \\(f(x)\\) to be within \\(\\epsilon\\) of \\(L\\) if \\(x\\) is within \\(\\delta\\) of \\(a\\). Note that this has to hold true for all \\(\\epsilon\\), and you choose \\(\\epsilon\\) first!

From this we get the well-known definition of the derivative:
$$f'(x) = \lim_{h \to 0} \frac{f(x+h)-f(x)}{h}$$
and you can define the integral similarly.

The limit solved calculus's rigor problem. From the limit the entire field of analysis was invented and placed on solid ground, and this foundation has stood to this day.

Yet, it seems like we lose something important when we replace the idea of the "infinitesimally small" with the "arbitrarily close to." Could we actually make numbers that were *infinitely small?*

## The Sequence Construction

Imagine some mathematical object that had all the relevant properties of the real numbers (addition, multiplication are associative and commutative, is closed, etc.) but had infinitely small and infinitely large numbers. What does this object look like? 

We can take the set of all infinite sequences of real numbers $\mathbb{R}^\mathbb{N}$ as a starting point. A typical element $a\in\mathbb{R}^\mathbb{N}$ would be
\\[a = (a_0, \, a_1, \, a_2, \ldots)\\] where $a_0, a_1, a_2, \ldots$ is some infinite sequence of real numbers. 

We can define addition and multiplication elementwise as:
\\[a + b = (a_{0} + b_{0}, \, a_{1} + b_{1}, a_{2} + b_{2}, \ldots),\\]
\\[a \\cdot b = (a_0 \\cdot b_0, a_1 \\cdot b_1, a_2 \\cdot b_2, \\ldots).\\]

You can verify that this is a commutative ring, which means that these operations behave nicely. Yet, being a commmutative ring is not the same thing as being an ordered field, which is what we eventually want if our desired object is to have the same properties as the reals.

To get from $\mathbb{R}^\mathbb{N}$ to a field structure, we have to modify it to accomodate well-defined division. The typical way of doing this is looking at how to introduce the zero product property: i.e. ensuring that if $a,b \in \mathbb{R}^\mathbb{N}$ then if $ab = 0$ either one of $a,b$ is $0$.

If we let $0$ be the sequence of all zeros $(0,0,0,\ldots)$ in $\mathbb{R}^\mathbb{N},$ then it is clear that we can have two non-zero elements multiply to get zero. If we have
\\[a = (a, 0, 0, 0, \\ldots),\\]
and \\[b = (0,b,b,b \\ldots),\\]
then neither of these are the zero element, yet their product is zero.

How do we fix this? Equivalence classes! 

Our problem is that there are too many distinct "zero-like" things in the ring of real numbered sequences. Intuitively, we should expect the sequence $(0,1,0,0,\ldots)$ to be *basically* zero, and we want to find a good condensation of $\mathbb{R}^\mathbb{N}$ that allows for this.

In other words, how do we make all the sequences with "[almost all](https://www.ykumar.org/posts/almost-always/)" their elements as zero to be equal to zero?

## Almost All Agreement ft. Ultrafilters

Taken from "[five ways to say \"Almost Always\" and actually mean it](https://www.ykumar.org/almost-always/)":

> A *filter* $\mathcal{F}$ on an arbitrary set \\(I\\) is a collection of subsets of \\(I\\) that is closed under set intersections and supersets. (Note that this means that the smallest filter on \\(I\\) is \\(I\\) itself).
>
> An *ultrafilter* is a filter which, for every \\(A \\subseteq I\\), contains either \\(A\\) or its complement. A *principal* ultrafilter contains a finite set. 
>
> A *nonprincipal ultrafilter* does not.
>
> This turns out to be an incredibly powerful mathematical tool, and can be used to generalize the concept of "almost all" to esoteric mathematical objects that might not have well-defined or intuitive properties. 

Let's say we define some nonprincipal ultrafilter $\mathcal{U}$ on the natural numbers. This will contain only cofinite sets, and will exclude all finite sets. Now, let's take two sequences $a,b \in \mathbb{R}^\mathbb{N},$ and define their *agreement set* \\(I\\) to be the indices on which \\(a,b\\) are identical (have the same real number in the same position).

Observe that \\(I\\) is a set of natural numbers. If \\(I \in \mathcal{U},\\) then \\(I\\) cannot be finite, and it seems pretty obvious that almost all the elements in \\(a,b\\) are the same (they only disagree at a finite number of places after all). Conversely, if $I \not\in \mathcal{U},$ this implies that the complement of \\(I,\\) $\mathbb{N}/I \in \mathcal{U}$, which means that \\(a,b\\) disagree at almost all positions, so they probably shouldn't be equal.

Voila! We have a suitable definition of "almost all agreement": if the agreement set $I$ is contained in some arbitrary nonprincipal ultrafilter $\mathcal{U}$.

Let $^*\mathbb{R}$ be the quotient set of $\mathbb{R}^\mathbb{N}$ under this equivalence relation (essentially, the set of all distinct equivalence classes of $\mathbb{R}^\mathbb{N}$). Does this satisfy the zero product property?

(Notation note: we will let \\((a)\\) denote the infinite sequence of the real number \\(a\\), and \\([a]\\) the equivalence class of the sequence \\((a)\\) in \\(^* \\mathbb{R}\\).)

## Yes, This Behaves Like The Real Numbers

Let $a,b \in \mathbb{R}^\mathbb{N}$ such that \\(ab = (0)\\). Let's break this down elementwise: either $a_n, b_n$ must be zero for all $n \in \mathbb{N}.$ As one of the ultrafilter axioms is that it must contain a set or its complement, either the index set of the zero elements in \\(a\\) or the index set of the zero elements in \\(b\\) will be in any nonprincipal ultrafilter on $\mathbb{N}.$ Therefore, either \\(a\\) or \\(b\\) is equivalent to $(0)$ in \\(^* \\mathbb{R},\\) so \\(^* \\mathbb{R}\\) satisfies the zero product property.

Therefore, division is well defined on \\(^\*\\mathbb{R}\\)! Now all we need is an ordering, and luckily almost all agreement saves the day again. We can say for \\(a,b \in ^\*\mathbb{R}\\) that $a>b$ if almost all elements in $a$ are greater than the elements in $b$ at the same positions (using the same ultrafilter equivalence).

So, \\(^\*\\mathbb{R}\\) is an ordered field! 

## Infinitesimals and Infinitely Large Numbers

We have the following hyperreal:

$$\epsilon = \left( 1, \frac{1}{2}, \frac{1}{3}, \ldots, \frac{1}{n}, \ldots \right).$$

Recall that we embed the real numbers into the hyperreals by assigning every real number \\(a\\) to the equivalence class \\([a]\\). Now observe that $\epsilon$ *is smaller than every real number embedded into the hyperreals this way.* 

Pick some arbitrary real number $a$. There exists \\(p \in \mathbb{N}\\) such that \\(\frac{1}{p}< a\\). There are infinitely many fractions of the form \\(\frac{1}{n}\\), where $n$ is a natural number greater than $p$, so $\epsilon$ is smaller than $(a)$ at almost all positions, so it is smaller than $a$. 

This is an infinitesimal! This is a rigorously defined, coherently defined, *infinitesimal number* smaller than all real numbers! In a number system which shares all of the important properties of the real numbers! (except the Archimedean one, as we will shortly see, but that doesn't really matter).

Consider the following

\\[ \\Omega = (1,2,3, \\ldots).\\]

By a similar argument this is larger than all possible real numbers. I encourage you to try to prove this for yourself!

(The Archimedean principle is that which guarantees that if you have any two real numbers, you can multiply the smaller by some natural number to become greater than the other. This is not true in the hyperreals. Why? (Hint: \\( \\Omega \\) breaks this if you consider a real number.))

## How does this tie into calculus, exactly?

Well, we have a coherent way of defining infinitesimals! 

The short answer is that we can define the *star* operator $\text{st}(x)$ as that which maps any hyperreal to its closest real counterpart, provided it can be written as the sum of a real number and an infinitesimal part. Then, the definition of a derivative becomes 
$$f'(x) = \text{st}\left( \frac{f(x+\Delta x)- f(x)}{\Delta x}\right)$$
where $\Delta x$ is some infinitesimal. More on this in a future blog post!

It also turns out the hyperreals have a bunch of really cool applications in fields far removed from analysis. Check out my expository paper on [the intersection of nonstandard analysis and Ramsey theory](https://ykumar.org/files/Nonstandard_Methods_and_Applications_in_Ramsey_Theory.pdf) for an example!

Yet, the biggest effect I think this will have is pedadogical. I've always found the definition of a limit kind of unintuitive, and it was specifically invented to add *post hoc* coherence to calculus after it had been invented and used widely. I suspect that formulating calculus via infinitesimals in introductory calculus classes would go a long way to making it more intuitive. 

And infinitely small things are cooler than limits any day.











