---
title: Ideas
date: 2023-11-03
author: Yudhister Kumar
---
*half-baked ideas. you know the drill.*

---

# Feynman Diagrams & GNNs

This one has been on my mind for a while (March 2022).

Fundamentally, Feynman diagrams are just graphs. So, you could probably fit a GNN to a dataset of existing Feynman diagrams and have it learn heuristics to compute them better.

[Turns out this was done in Nov 2022](https://arxiv.org/pdf/2211.15348.pdf). Abstract:

> In the wake of the growing popularity of machine learning in particle physics, this
work finds a new application of geometric deep learning on Feynman diagrams to
make accurate and fast matrix element predictions with the potential to be used
in analysis of quantum field theory. This research uses the graph attention layer
which makes matrix element predictions to 1 significant figure accuracy above 90%
of the time. Peak performance was achieved in making predictions to 3 significant
figure accuracy over 10% of the time with less than 200 epochs of training, serving
as a proof of concept on which future works can build upon for better performance.
Finally, a procedure is suggested, to use the network to make advancements in
quantum field theory by constructing Feynman diagrams with effective particles
that represent non-perturbative calculations.

But there's more work to do -- this is a proof of concept only tested on a limited dataset. I'm excited about integrating this with symbolic regression to recover potentially closed-form heuristics, or applying this to stuff like QCD where Feynman diagram computation is intractable (?)

(although my knowledge of fundamental physics is very lacking)

## GNN Stuff

* [Pytorch Geometric](https://pytorch-geometric.readthedocs.io/en/latest/) 
* [Jraph](https://github.com/google-deepmind/jraph) -- DeepMind's JAX based GNN software. Has a really cool [Higgs boson detection algorithm](https://github.com/google-deepmind/jraph/blob/master/jraph/examples/higgs_detection.py) as an example. I find this more intuitive than PyG, but also maybe not maintained as well? although it's been a solid year since I looked at it 
* I don't think there's that much other stuff I'm missing. Maybe good resources for understanding how GNNs work.

## Feynman Diagram Stuff

(stuff that might be useful for understanding how to represent Feynman diagrams as graphs idk)

* [Feymman Diagrams Via Graphical Calculus](https://arxiv.org/pdf/math/0106001.pdf)
* [Feynman Diagrams for Beginners](https://arxiv.org/pdf/1602.04182.pdf)
* a bunch of other stuff I'm missing

## Symbolic Regression

* [PySR](https://astroautomata.com/PySR/) by Miles Crammer is the only decent symbolic regression software that exists nowdays. The documentation is on his website, not on PyPI. Beware.
* [Discovering Symbolic Models from Deep Learning with Inductive Biases](https://arxiv.org/pdf/2006.11287.pdf) Miles Crammer et. al. use PySR & GNNs to recover & create astrophysics formulae, as well as recovering Newtonian & Hamiltonian dynamics
* a bunch of other papers I'm missing

## Bottlenecks

How to represent Feynman diagrams as graphs? Mitchell et. al. have a good formulation which I should still understand better. So, concrete steps:

* replicate Mitchell et. al. 2022
* figure out how it's limited (likely can't consider loop diagrams)
* CERN is beginning to adopt novel algos for churning through the hundreds of terabytes of data they create each day. They have some really cool stuff on classifying particle jets, and some really cool datasets. Make a better algorithm for that
* profit?

# Half-Baked

* Longtermism is fake because any practical value model needs to have a time discount factor (for practicality)
* 
