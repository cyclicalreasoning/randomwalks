---
title: "Self-Referential Probabilistic Logic Admits the Payor's Lemma"
author: "Yudhister Kumar"
date: 2023-11-29
---
Better formatted version on [LessWrong](https://www.lesswrong.com/posts/wmJT2j3rdT8ngFkPN/self-referential-probabilistic-logic-admits-the-payor-s).

---

*In summary: A probabilistic version of the [Payor's Lemma](https://www.alignmentforum.org/posts/2WpPRrqrFQa6n2x3W/modal-fixpoint-cooperation-without-loeb-s-theorem) holds under the logic proposed in the [Definability of Truth in Probabilistic Logic](http://intelligence.org/files/DefinabilityTruthDraft.pdf). This gives us modal fixed-point-esque group cooperation even under probabilistic guarantees.*

# Background

**Payor's Lemma:** If $\vdash \Box (\Box x \to x) \to x,$ then $\vdash x.$ 

We assume two rules of inference:

- **Necessitation:** $\vdash x \implies \vdash \Box x,$
- **Distributivity:** $\vdash \Box(x \to y) \implies \vdash \Box x \to \Box y.$ 

**Proof:**

1. $\vdash x \to (\Box x \to x),$ by tautology;
2. $\vdash \Box x \to \Box (\Box x \to x),$ by 1 via necessitation and distributivity;
3. $\vdash \Box (\Box x \to x) \to x$, by assumption;
4. $\vdash \Box x \to x,$ from 2 and 3 by modus ponens;
5. $\vdash \Box (\Box x \to x),$ from 4 by necessitation;
6. $\vdash x,$ from 5 and 3 by modus ponens.

The Payor's Lemma is provable in all normal modal logics (as it can be proved in $K,$ the weakest, because it only uses necessitation and distributivity). Its proof sidesteps the assertion of an arbitrary modal fixedpoint, does not require internal necessitation ($\vdash \Box x \implies \vdash \Box \Box x$), and provides the groundwork  for Lobian handshake-based cooperation without Lob's theorem.

It is known that Lob's theorem [fails to hold in reflective theories of logical uncertainty](https://www.lesswrong.com/posts/oBDTMnEzptBidvmw7/probabilistic-loeb-theorem). However, a [proof of a probabilistic Payor's lemma](https://www.alignmentforum.org/posts/ZWhJcHPmRaXAPAK5k/probabilistic-payor-lemma) has been proposed, which modifies the rules of inference necessary to be:

- **Necessitation:** $\vdash x \implies \vdash \Box_p \, x,$
- **Weak Distributivity:** $\vdash x \to y \implies \vdash \Box_p \, x \to \Box_p \, y.$

where here we take $\Box_p$ to be an operator which returns True if the internal credence of $x$ is greater than $p$ and False if not. (Formalisms incoming).

The question is then: does there exist a consistent formalism under which these rules of inference hold? The answer is yes, and it is provided by [Christiano 2012](http://intelligence.org/files/DefinabilityTruthDraft.pdf). 
# Setup

(Regurgitation and rewording of the relevant parts of the [Definability of Truth](http://intelligence.org/files/DefinabilityTruthDraft.pdf))

Let $L$ be some language and $T$ be a theory over that language. Assume that $L$ is powerful enough to admit a Godel encoding and that it contains terms which correspond to the rational numbers $\mathbb{Q}.$ Let $\phi_1, \phi_{2} \ldots$ be some fixed enumeration of all sentences in $L.$ Let $\ulcorner \phi \urcorner$ represent the Godel encoding of $\phi.$ 

We are interested in the existence and behavior of a function $\mathbb{P}: L \to [0,1]^L,$ which assigns a real-valued probability in $[0,1]$ to each well-formed sentence of $L.$ We are guaranteed the coherency of $\mathbb{P}$ with the following assumptions:
1.  For all $\phi, \psi \in L$ we have that $\mathbb{P}(\phi) = \mathbb{P}(\phi \land \psi) + \mathbb{P}(\phi \lor \neg \psi).$
2. For each tautology $\phi,$ we have $\mathbb{P}(\phi) = 1.$
3.  For each contradiction $\phi,$ we have $\mathbb{P}(\phi) = 0.$

Note: I think that 2 & 3 are redundant (as says John Baez), and that these axioms do not necessarily constrain $\mathbb{P}$ to $[0,1]$ in and of themselves (hence the extra restriction). However, neither concern is relevant to the result.

A coherent $\mathbb{P}$ corresponds to a distribution $\mu$ over models of $L.$ A coherent $\mathbb{P}$ which gives probability 1 to $T$ corresponds to a distribution $\mu$ over models of $T$. We denote a function which generates a distribution over models of a given theory $T$ as $\mathbb{P}_T.$

**Syntactic-Probabilistic Correspondence:** Observe that $\mathbb{P}_T(\phi) =1 \iff T \vdash \phi.$ This allows us to interchange the notions of syntactic consequence and probabilistic certainty.

Now, we want $\mathbb{P}$ to give sane probabilities to sentences which talk about the probability $\mathbb{P}$ gives them. This means that we need some way of giving $L$ the ability to talk about itself.

Consider the formula $Bel.$ $Bel$ takes as input the Godel encodings of sentences. $Bel(\ulcorner \phi \urcorner)$ contains *arbitrarily precise* information about $\mathbb{P}(\phi).$ In other words, if $\mathbb{P}(\phi) = p,$ then the statement $Bel(\ulcorner \phi \urcorner) > a$ is True for all $a < p,$ and the statement $Bel(\ulcorner \phi \urcorner) > b$ is False for all $b > p.$ $Bel$ is fundamentally *a part* of the system, as opposed to being some metalanguage concept. 

(These are identical properties to that represented in Christiano 2012 by $\mathbb{P}(\ulcorner \phi \urcorner).$ I simply choose to represent $\mathbb{P}(\ulcorner \phi \urcorner)$ with $Bel(\ulcorner \phi \urcorner)$ as it (1) reduces notational uncertainty and (2) seems to be more in the spirit of Godel's $Bew$ for provability logic).

Let $L'$ denote the language created by affixing $Bel$ to $L.$ Then, there exists a coherent $\mathbb{P}_T$ for a given consistent theory $T$ over $L$ such that the following reflection principle is satisfied:

$$\forall \phi \in L' \, \, \forall a,b, \in \mathbb{Q} : (a < \mathbb{P}_{T}(\phi)<b) \implies \mathbb{P}_{T}(a < Bel(\ulcorner \phi \urcorner) < b) = 1.$$

In other words, $a  < \mathbb{P}_T(\phi) < b$ implies $T \vdash a < Bel(\ulcorner \phi \urcorner) < b.$ 
# Proof

(From now, for simplicity, we use $\mathbb{P}$ to refer to $\mathbb{P}_T$ and $\vdash$ to refer to $T \vdash.$ You can think of this as fixing some theory $T$ and operating within it).

Let $\Box_p \, (\phi)$ represent the sentence $Bel(\ulcorner \phi \urcorner) > p,$ for some $p \in \mathbb{Q}.$ We abbreviate $\Box_p \, (\phi)$ as $\Box_p \, \phi.$ Then, we have the following:

**Probabilistic Payor's Lemma:** If $\vdash \Box_p \, (\Box_p \, x \to x) \to x,$ then $\vdash x.$ 

**Proof** [as per Demski](https://www.lesswrong.com/posts/ZWhJcHPmRaXAPAK5k/probabilistic-payor-lemma): 
1. $\vdash x \to (\Box_{p}\,x \to x),$ by tautology;
2. $\vdash \Box_{p}\, x \to \Box_{p}\, (\Box_{p}\, x \to x),$ by 1 via weak distributivity,
3. $\vdash \Box_{p} (\Box_{p} \, x \to x) \to x$, by assumption;
4. $\vdash \Box_{p} \, x \to x,$ from 2 and 3 by modus ponens;
5. $\vdash \Box_{p}\, (\Box_{p}\, x \to x),$ from 4 by necessitation;
6. $\vdash x,$ from 5 and 3 by modus ponens.
## Rules of Inference

**Necessitation:** $\vdash x \implies \vdash \Box_p \, x.$ If $\vdash x,$ then $\mathbb{P}(x) = 1$ by syntactic-probabilistic correspondence, so by the reflection principle we have $\mathbb{P}(\Box_p \, x) = 1,$ and as such $\vdash \Box_p \, x$ by syntactic-probabilistic correspondence.

**Weak Distributivity:** $\vdash x \to y \implies \vdash \Box_p \, x \to \Box_p \, y.$ The proof of this is slightly more involved.

From $\vdash x \to y$ we have (via correspondence) that $\mathbb{P}(x \to y) = 1,$ so $\mathbb{P}(\neg x \lor y) = 1.$ We want to prove that $\mathbb{P}(\Box_p \, x \to \Box_p \, y) = 1$ from this, or $\mathbb{P}((Bel(\ulcorner x \urcorner) \leq p) \lor (Bel(\ulcorner y \urcorner) > p)) = 1.$ We can do casework on $x$. If $\mathbb{P}(x) \leq p,$ then weak distributivity follows from vacuousness. If $\mathbb{P}(x) >p,$ then as
$$
\begin{align*}
\mathbb{P}(\neg x \lor y) &= \mathbb{P}(x \land(\neg x \lor y)) + \mathbb{P}(\neg x \land (\neg x \lor y)), \\
1 &= \mathbb{P}(x \land y) + \mathbb{P}(\neg x \lor (\neg x \land y)), \\
1 &= \mathbb{P}(x \land y) + \mathbb{P}(\neg x),
\end{align*}
$$
$\mathbb{P}(\neg x) < 1-p,$ so $\mathbb{P}(x \land y) < p,$ and therefore $\mathbb{P}(y) > p.$ Then, $Bel(\ulcorner y \urcorner) > p$ is True by reflection, so by correspondence it follows that $\vdash \Box_p \, x \to \Box_p y.$ 

(I'm pretty sure this modal logic, following necessitation and weak distributivity, is not normal (it's weaker than $K$). This may have some implications? But in the 'agent' context I don't think that restricting ourselves to modal logics makes sense). 

# Bots

Consider agents $A,B,C$ which return True to signify cooperation in a multi-agent Prisoner's Dilemma and False to signify defection. (Similar setup to [Critch's](https://www.alignmentforum.org/posts/2WpPRrqrFQa6n2x3W/modal-fixpoint-cooperation-without-loeb-s-theorem) ). Each agent has 'beliefs' $\mathbb{P}_A, \mathbb{P}_B, \mathbb{P}_C : L \to [0,1]^L$ representing their credences over all formal statements in their respective languages (we are assuming they share the same language: this is unnecessary). 

Each agent has the ability to reason about their own 'beliefs' about the world arbitrarily precisely, and this allows them full knowledge of their utility function (if they are VNM agents, and up to the complexity of the world-states they can internally represent). Then, these agents can be modeled with Christiano's probabilistic logic! And I would argue it is natural to do so (you could easily imagine an agent having access to its own beliefs with arbitrary precision by, say, repeatedly querying its own preferences).

Then, if $A,B,C$ each behave in the following manner:
- $\vdash \Box_a \, (\Box_e \, E \to E) \to A,$
- $\vdash  \Box_b \, (\Box_e \, E \to E) \to B,$
- $\vdash \Box_c \, (\Box_e \, E \to E) \to C,$

where $E = A \land B \land C$ and $e = \max (\{ a,b,c \}),$ they will cooperate by the probabilistic Payor's lemma.

**Proof:**

1. $\vdash \Box_a \, (\Box_e \, E \to E) \land \Box_b \, (\Box_e \, E \to E) \land \Box_c \, (\Box_e \, E \to E) \to A \land B \land C,$ via conjunction;
2. $\vdash \Box_e \, (\Box_e \, E \to E) \to E,$ as if the $e$-threshold is satisfied all others are as well;
3. $\vdash E,$ by probabilistic Payor. 

This can be extended to arbitrarily many agents. Moreso, the valuable insight here is that cooperation is achieved *when the evidence that the group cooperates exceeds each and every member's individual threshold for cooperation.* A formalism of the intuitive strategy 'I will only cooperate if there are no defectors' (or perhaps 'we will only cooperate if there are no defectors').

It is important to note that any $\mathbb{P}$ is going to be uncomputable. However, I think modeling agents as having arbitrary access to their beliefs is in line with existing 'ideal' models (think VNM -- I suspect that this formalism closely maps to VNM agents that have access to arbitrary information about their utility function, at least in the form of preferences), and these agents play well with modal fixedpoint cooperation.

# Acknowledgements

This work was done while I was a 2023 Summer Research Fellow at the Center on Long-Term Risk. Many thanks to Abram Demski, my mentor who got me started on this project, as well as Sam Eisenstat for some helpful conversations. CLR was a great place to work! Would highly recommend if you're interested in s-risk reduction.
