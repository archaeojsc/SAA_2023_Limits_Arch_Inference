---
title: "Why is there Math in my Archaeology?"
# subtitle: "The modern foundations of quantitative archaeology, written decades too soon"

bibliography: 2023_SAA.bib
reference-section-title: "References Cited"
link-citations: true
urlcolor: blue

# nocite: '@*'

---

## Introduction



Fifty years ago, what arguably could have been one of the most important papers written for modern work in quantitative archaeology was published in American Antiquity. Unfortunately for its author, and generations of archaeologists, it received relatively little attention at the time. With few citations, more than half of which have occurred in just the last few years, its elegance and mathematical precision went largely unappreciated.

John Justeson's 1973 article "Limitations of archaeological inference: an information-theoretic approach with applications in methodology" was rather ambitious:

> "A framework is established for the application of information-theoretic concepts to the study of archaeological inference, ultimately to provide an estimate of the degree to which archaeologists, or anthropologists in general, can provide legitimate answers to the questions they investigate. Particular information-theoretic measures are applied to the design elements on the ceramics of a southwestern pueblo to show the methodological utility of information theory in helping to reach closer to that limit." [@Justeson1973]

The premise was actually quite straightforward -- behavioral information is "encoded" in the material artifacts deposited within an archaeological site, and the archaeologist's goal is to "decode" that information on the other end. The novelty was that John saw this "encoding-decoding" process as an information flow that could be described by what was (at the time) a relatively esoteric set of mathematical tools known as *information theory*. 

The foundations of information theory were developed by @Shannon1948 as a way to analyze the transmission of information *independently* of the content of the message.

> "The fundamental problem of communication is that of reproducing at one point either exactly or approximately a message selected at another point. Frequently the messages have meaning; that is they refer to or are correlated according to some system with certain physical or conceptual entities." [@Shannon1948, p.1]

Justeson saw that this approach might also be used to establish an "upper limit" for how interpretable archaeological data could be. Moreover, he demonstrated that we could reasonably calculate a quantifiable *measurement* for that upper limit form those data.

> "If the empirically measured parameters are not consistent with the relationship between them that is required by the theory for a given material or behavioral system, then the data by which that system is to be interpreted cannot have a consistent susceptibility to decoding; that is, there will be no basis for deriving a coherent archaeological interpretation of the data that will accurately reflect the prehistoric situation." [@Justeson1973, p. 136]

In other words, observed archaeological features or attributes should represent a coherent and systematic pattern of activities. 

In particular, he was addressing two *inherent* limitations of the archaeological record:

1. limitations imposed by the degree of preservation of culturally significant remains and by the skewing of their relationships through time until their recovery; and
2. limitations on the interpretability of archaeological data for the cultural descriptions.

The first limitation is analogous degradation of a signal due to noise or interference affecting a transmission, and the second to the encoding and decoding of that signal between sender and receiver.

@Schiffer1972 had previously elaborated on the distinction between *systemic* and *archaeological* contexts, differentiating between the cultural and taphonomic processes that create the observable archaeological record. It would not be until a decade later [@Schiffer1983; @Schiffer1987] that he would formalize these as *natural* versus *cultural* transformation processes (i.e., $n$-transforms and $c$-transforms). @Justeson1973 

## A Brief Introduction to Information Theory

At the heart of information theory is a single equation  that aimed to quantify a measure of information based on the concept of *entropy* from the thermodynamics of physical systems:

$$
H(\cal{X}) = - \sum_{i=1}^{n} p(x_i) \log_2 p(x_i)
$$

The total information entropy $H$ of some system $\cal{X}$, which contains some number of discrete features or attributes ($x_{1}, x_{2}, \ldots x_{n}$), is defined as the negative sum over all features of each attribute's probability of occurrence $p(x_i)$ times the $\log_2$[^fn01] of that probability.

[^fn01]: $\log_2$ refers to the base-2 or *binary* logarithm.

What this does is to give a measure for the minimum number of "events" of that system that it would take before we could start detecting a pattern. The more events it would take, the less information each observation is actually giving us. One easy way to think of it is that, for a high-entropy event, we could not reliably predict any individual occurrence. A high-entropy event is completely random -- i.e., *any* outcome is equally likely each time so we are likely to be *surprised* each time.

After *a lot* of observations we could make a fair prediction of the outcomes over a *large* number of events, but still couldn't accurately predict any single event. Each individual event gives us only a *small* amount of information, so we would need a large number of observations before we could distinguish it from some other system. Conversely, it would not take long to notice something that regularly (or never) occurs. Each event provides a *lot* of information, so fewer observations would be needed to start seeing a pattern emerge.

## Information in Archaeology

## Channels, Classification, and Signal

![Schematic representation of information transmission [Fig. 1 @Justeson1973, p. 133].](Justeson_1973_figure_1.png)

$$
\biggl \lbrace (u_1, A_1), \ldots, (u_N, A_N) \biggr \rbrace
$$

$$
P \big \lbrace v(u_i) \in A_i \big \rbrace \geqslant 1 - \lambda, i=1, \ldots,N
$$

$$
C = \max_{\pi} \left\lbrace \sum_j \left\lbrack\sum_i \pi_i w(j|i) \log_2 \sum_i \pi_i w(j|i) - \sum_i \pi_i w(j|i) \log_2 \sum_i \pi_i w(j|i)\right\rbrack \right\rbrace
$$

## Applications

### Extrapolation of the Prehistoric Distribution of Design Elements

$$
M_t = \sum^{T}_{i=t} N_i
$$

$$
L_t = \sum^{T}_{i=t} M_i
$$

### Noise

<!-- calculate noise factor for each design element -->

$$
\begin{aligned}
    \psi(r) &= P(\text{receiving design element r given that r was sent})\\
    &=P(\text{receiving r} \ | \ \text{r was sent})
\end{aligned}
$$

$$
\begin{aligned}
P(A|B) = &P(A \ \text{and} \ B) \div P(B) \text{, so} \\ 
&P(\text{r sent} \ | \ \text{r received}) \cdot P(\text{r received})\\
= &P(\text{r sent and r received})\\
= &P(\text{r received} \ | \ \text{r sent}) \cdot P(\text{r sent}) \\
\end{aligned}
$$

$$
\begin{aligned}
\min_r \psi(r) &= \min_r P(\text{r received} \ | \ \text{r sent}) \\
&= \min_r 1 - P(\text{r not received} \ | \ \text{r sent}) \\
&= \max_r P(\text{r not received} \ | \ \text{r sent}) \\
&= 1- \lambda
\end{aligned}
$$

$$
\begin{aligned}
\overline{\psi} &= \sum_r p_E(r) \psi(r) \\
&= \sum_r p_E(r) \left \lbrack p(r) \div p_E(r) \right \rbrack \\
&= \sum_r p(r) = 1
\end{aligned}
$$

$$
\begin{aligned}
H' &= -\sum_{i=1}^k p(x_i) \log_2 p(x_i) \\
&= -\sum_{i=1}^k \frac{1}{k} \log_2 \frac{1}{k} \\
&= -\log_2 \frac{1}{k} \\
&= \log_2 k
\end{aligned}
$$

$$
h = H/H' \ \text{and} \ h_E = H_E/H'_E
$$
