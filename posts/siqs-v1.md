---
title: 'Some Interesting Quantum Stuff #1'
date: 2023-04-14
author: Yudhister Kumar
type: blog
tags: ['physics', 'math']
description: "A brief derivation of Snell's law, single slit diffraction, and buckyballs."
---
## A Brief Derivation of Snell's Law

> *We live in the best of all possible worlds. -Leibniz*

Light takes the [shortest path available to it](https://en.wikipedia.org/wiki/Fermat%27s_principle) (with regards to time, not necessarily distance). It turns out this can be generalized to the least-action principle, but we're not particularly concerned with that here. 

Consider a ray of light that refracts into something. It enters at an angle $\theta_{i}$ and exits at an angle $\theta_{r}$ (as measured from the normal of the surface). Let the first medium have refractive index $n_{1},$ and the second have refractive index $n_{2}.$ Then, we can set up the following:

<img src="/images/Screenshot_2023-04-14_17-01-42.png" alt="Snell's Law" size="600x">

We find $t_1$ and $t_{2}$ as the time it takes for light to travel in mediums 1 & 2 respectively

$$t_{1} = \frac{n_1}{c}\sqrt{x^2+a^2},$$
$$t_{2} = \frac{n_{2}}{c}\sqrt{(D-x)^2+a^2}.$$

Let $t=t_1+t_2.$ By the principle of least time, \\(t\\) is minimized, and \\(t\\) is dependent on \\(x\\) alone. Therefore, we have that its derivative with respect to \\(x\\) must be \\(0,\\) and as such
$$
\frac{dt}{dx}=0, \, \frac{dt_{1}}{dx}=-\frac{dt_{2}}{dx}.
$$

Doing the calculation, we find that this means
$$
\begin{align*}
\frac{n_{1}x}{\sqrt{ x^2+a^2 }}&=\frac{n_{2}(D-x)}{\sqrt{ (D-x)^2+a^2 }}.
\end{align*}
$$
 
Observing that $$\sin \theta = \frac{x}{\sqrt{x^2+a^2}}$$ (and similarly for $\sin \theta_{r}$), we have the much awaited Snell's Law:
$$
\boxed{n_{1}\sin\theta_{i}=n_{2}\sin\theta_{r}.}
$$

## Single Slit Diffraction

<img src="/images/Pasted image 20230412125321.png" alt="Single Slit" width="600px" >
(*from Townsend's Quantum Mechanics*)

We want to find the diffraction pattern given by a photon (with wavelength $\lambda$ ) which passes through a single slit (as opposed to the famous double-slit experiment). 

To do this, we can calculate the probability amplitude of a photon hitting detector $P$ at angle $\theta,$ and we do this by integrating a differential probability amplitude over the slit:
$$
dz_{p} = r \frac{dx}{a}e^{ik(d_{1} + x\sin\theta)},
$$
where $d_1$ is the distance from the top of the slit to point $P,$ and \\(x \\sin \\theta\\) is the distance difference between the path from \\(P\\) at \\(dx\\) versus when \\(x=0\\) (this holds true when \\(P\\) is far enough away for us to assume that the two paths are parallel).

WIth some math, we find that

$$
\begin{align*}\int dz_{p} &= \int_{0}^a \frac{r}{a}e^{ik(d_{1}+x\sin \theta)} \, dx \\\
&=\frac{r}{a}\left[ \frac{e^{ik(d_{1}+x\sin\theta)}}{ik\sin\theta} \right]^a_{0} \\\
z_{p} &= \frac{re^{ikd_{1}}}{ika\sin\theta}\left(e^{ika\sin\theta}-1\right).
\end{align*}
$$


Now that we have the probability amplitude, we can multiply by its conjugate to get the probability:
$$
\begin{align*}
z_{p} * z_{p} &= \left(\frac{re^{ikd_{1}}}{ika\sin\theta}\left(e^{ika\sin\theta}-1\right)\right) \left( \frac{re^{-ikd_{1}}}{-ika\sin\theta}\left(e^{-ika\sin\theta}-1\right)\right) \\\
&= \frac{r^2}{k^2a^2\sin^2\theta}(2-2\cos(ka\sin \theta)) \\\
&= \frac{r^2\sin^2\alpha}{\alpha^2}, \, \, \, \alpha=\frac{ka\sin\theta}{2}.
\end{align*}
$$
This describes the general diffraction pattern dependent on \\(\theta.\\) Some cool things to note: the intensity is the greatest at \\( \\theta=0,\\) as a result of \\(\\lim_{ x \\to 0} \\frac\{\\sin x\}\{x\}=1,\\) (this should make sense - intensity is greatest if the wave keeps going in a straight line). 

Interference makes the diffraction pattern vanish when \\(a\\sin\\theta=n\\lambda,\\) where \\(n\\) is an integer. An image of a single slit diffraction is given below.

<img src="/images/Pasted image 20230414161440.png" alt="Single Slit Example" size="600x" >

(*from [this](https://physlab.org/experiment/diffraction-from-single-slit/) link*)

An intuitive explanation of this is if you pair up each of the point sources in the single-slit (each of the \\(dx\\) values) such that there is \\(a/2\\) distance between the elements in each pair, they will destructively interfere if their path difference \\(\\frac\{a\}\{2\} \\sin\\theta\\) is some multiple of \\(\\frac\{\\lambda\}\{2\},\\) because then they're out of phase by $\pi.$ At certain values of \\(\\theta,\\) this is true for all point sources, so the intensity reaches a minimum.  

Note that you *can't* consider single slit diffraction as the limit of many slit diffraction. With many slits, there's still a finite distance between each slit, while single slit diffraction does not have this distinction. (Plausibly you can get around this if you take the correct limits, but the sort of discrete path interference setup is not applicable to single-slits).

## Buckyballs, Yo

Buckminsterfullerene is a carbon complex consisting of sixty carbon atoms arranged in a football shape.

<img src="/images/Buckminsterfullerene-perspective-3D-balls.png" alt="BuckyBall" width=400x >

*(from Wikipedia, the great \\(C^{60}!\\))*

They're pretty big. But in 1999, a team in Vienna was able to detect *wave-particle duality* on a macroscopic level from these molecules!

These buckyballs were observed to have a deBroglie wavelength of \\(2.5\times 10^{-23} \text{ m},\\) about 400x smaller than their diameter, by passing them through some microscopic slits and then ionizing them. More info, and the paper, can be found [here](https://physicsworld.com/a/wave-particle-duality-seen-in-carbon-60-molecules/)!

*Thanks to Nick Heller for introducing me to much of this!*

