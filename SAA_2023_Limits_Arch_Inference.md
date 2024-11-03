---
title: |
    "Why is there Math in my Archaeology?"

subtitle: |
    "The modern foundations of quantitative archaeology, written decades too soon"

bibliography: 2023_SAA.bib
reference-section-title: "References Cited"
link-citations: true
urlcolor: blue

# nocite: '@*'

---

## Introduction

...

<!-- * Quantitative approaches in archaeology beginning with Petrie's application of sequence dating (i.e., seriation) in 1899 [@Kendall1969].
* It was not until the 1950s that formal statistical methods started to play a more substantial role in archaeological methodologies [@Ammerman1992]. Early work by archaeologists such as @Brainerd1951, @Spaulding1953, and @Heizer1956 foreshadowed an emergent *computational archaeology* [@Djindjian2015].
* By the 1970s
*  -->

Fifty years ago, what arguably could have been one of the most important papers written for modern work in quantitative archaeology was published in American Antiquity. Unfortunately for its author, and generations of archaeologists, it received relatively little attention at the time. With few citations, more than half of which have occurred in just the last few years, its elegance and mathematical precision went largely unappreciated.

John Justeson's article "Limitations of archaeological inference: an information-theoretic approach with applications in methodology" [-@Justeson1973] was rather ambitious, as can be seen from its abstract:

> "A framework is established for the application of information-theoretic concepts to the study of archaeological inference, ultimately to provide an estimate of the degree to which archaeologists, or anthropologists in general, can provide legitimate answers to the questions they investigate. Particular information-theoretic measures are applied to the design elements on the ceramics of a southwestern pueblo to show the methodological utility of information theory in helping to reach closer to that limit." [@Justeson1973]

The premise was actually quite straightforward -- behavioral information is "encoded" in the material artifacts deposited within an archaeological site, and the archaeologist's goal is to "decode" that information on the other end. The novelty was that John saw this "encoding-decoding" process as an information flow that could be described by what was (at the time) a relatively esoteric set of mathematical tools known as *information theory*.

The foundations of information theory were developed by Claude Shannon as a way to analyze the transmission of information *independently* of the content of a message.

> "The fundamental problem of communication is that of reproducing at one point either exactly or approximately a message selected at another point. Frequently the messages have meaning; that is they refer to or are correlated according to some system with certain physical or conceptual entities." [@Shannon1948, p.1]

Justeson saw that this approach might also be used to establish an "upper limit" for how interpretable archaeological data could be. Moreover, he demonstrated that we could reasonably calculate a quantifiable *measurement* for that upper limit from those data.

> "If the empirically measured parameters are not consistent with the relationship between them that is required by the theory for a given material or behavioral system, then the data by which that system is to be interpreted cannot have a consistent susceptibility to decoding; that is, there will be no basis for deriving a coherent archaeological interpretation of the data that will accurately reflect the prehistoric situation." [@Justeson1973, p. 136]

In other words, observed archaeological features or attributes should represent a coherent and systematic pattern of activities. If not, then there would be no viable and supportable interpretation for that data available to archaeologists.

In particular, he was addressing two *inherent* limitations of the archaeological record:

1. limitations imposed by the degree of preservation of culturally significant remains and by the skewing of their relationships through time until their recovery; and
2. limitations on the interpretability of archaeological data for the cultural descriptions.

The first limitation is analogous degradation of a signal due to noise or interference affecting a transmission, and the second to the encoding and decoding of that signal between sender and receiver.

@Schiffer1972 had previously elaborated on the distinction between *systemic* and *archaeological* contexts, differentiating between the cultural and taphonomic processes that create the observable archaeological record. It would not be until a decade later [@Schiffer1983; @Schiffer1987] that he would formalize these as *natural* versus *cultural* transformation processes (i.e., $n$-transforms and $c$-transforms). @Justeson1973 ...

## A Gentle Introduction to Information Theory

What is now known as *Information Theory* largely began with a seminal paper written by Claude Shannon, titled "A Mathematical Theory of Communication" [-@Shannon1948] resulting from his work in cryptography at Bell Labs. At the heart of Shannon's theory was the idea that *information* is fundamentally tied to the reduction of *uncertainty*. Shannon approached information not in terms of meaning, but as a measure of the *reduction of uncertainty* within a system of communication.

### Information, Entropy, and Surprisal

Shannon proposed a particular relationship between information and uncertainty in terms of statistical probabilities. He derived a quantitative measure of that uncertainty derived from the concept of *entropy* used to describe disorder in the thermodynamics of physical systems. Shannon, however, repurposed entropy to refer to the average uncertainty contained in a system  given by the equation:  

\[
    H(\cal{X}) = - \sum_{i=1}^{n} p(x_i) \ \log_2 \ p(x_i)
\]

What this equation is describing is the total entropy \(H\) of some system \(\cal{X}\) that contains \(n\) discrete attributes or elements \((x_{1}, x_{2}, \ldots x_{n})\). The entropy is equal to the negative sum, over all \(n\) features, of each element's probability of occurrence \(p(x_i)\) times the \(\log_2\)[^fn01] of that probability.

[^fn01]: \(\log_2\) refers to the base-2 logarithm.

The higher the entropy of a system, indicated by a larger value for $H$, the more uncertainty or randomness there is to the elements of \(\cal{X}\). Somewhat counterintuitively, the more uncertain or random a system the more information it conveys. Remember that Shannon defines information as the reduction of uncertainty. The greater the uncertainty (i.e., high entropy), the more potential information the system is capable of producing because there is greater uncertainty to reduce.

To see how, we need to understand what Shannon defined as *surprisal*. Surprisal, also known as self-information, is a measure of how surprising or unexpected a specific event is based on its probability. In essence, surprisal measures the information content of a specific outcome -- i.e., rare events carry more information than common ones because they are less expected. Low probability events, those that occur infrequently, are highly surprising. Conversely, high probability events are not.

Consider it this way -- if an event is nearly certain to occur, you would *already* be expecting it to happen when it does. Its occurrence tells you nothing that you did not already know. It is only when something happens that we did *not* expect (i.e., we are surprised) that it is providing *new* information. Therefore, surprisal (denoted as \(I(x)\)) is the potential *information* contained in a single event based on its probability \(p(x)\):

\[
    I(x) = - \log_2 p(x)
\]

Surprisal is zero for events that are certain (i.e., the probability \(p(x)=1\)), and grows larger as the probability of the event decreases (Figure {#figure:surprisal_example}). Exceedingly rare events, by contrast, would be very surprising to witness and approaching "infinitely" surprising as the probability of the event goes to zero (i.e., \(lim_{p(x) \to 0} \ I(x) = \infty\)).

![The surprisal $I(x)$ of a coin flip $x$ (i.e., lands "heads" or "tails") as the probability $p(x)$ of landing "heads" ranges from $0$ to $1$ for a "biased" coin. A "fair" coin would land on heads or tails with equal chances or \(p(x)=0.5\).](./surprisal.png){#figure:surprisal_example}

Entropy represents the *average* surprisal over all possible outcomes from a probability distribution. It quantifies the overall uncertainty or unpredictability of a system or source of information. The higher the entropy, the more information the system is capable of producing, since there is greater uncertainty about which outcome will occur.

Entropy is highest when all outcomes are equally likely, and decreases as we gain more information to anticipate whether or not that event is likely to occur (Figure {#figure:entropy_example}). Information is therefore the reduction of that uncertainty or entropy when a new event is observed. We have learned more about the underlying probabilities for future events.

![The overall system entropy \(H(\cal{X})\) for biased coin flips as the probability \(p(x)\) of landing "heads" ranges from 0 to 1. A "fair" coin with \(p(x)=0.5\) is the system with the most uncertainty, since either outcome ("heads" or "tails") is equally possible.](./Entropy.png){#figure:entropy_example}

For the first time, scientists had a way to *quantify* information. Shannon had defined information in a way that made it possible to measure and *analyze* it mathematically, based solely on its statistical structure and independently of its content or meaning.

Information theory has evolved over the last few decades into a highly diverse discipline in its own right, with broad applications. Shannon, however, developed the theory towards one particular application -- communication. Specifically, he was looking for a way to understand how information could be efficiently and reliably transmitted across communication systems, especially in the presence of noise or interference.  

### Channel, Signal, and Noise

Under Shannon's model of communication, the relationships between information, channel, signal, noise, and channel capacity define the core aspects for transmitting data effectively. Information represents the content or message that needs to be conveyed, which can vary in complexity. In this context, entropy is a measure of the inherent complexity of the information a message might contain -- i.e., higher entropy indicates greater variability in *potential* messages.

A communication *channel* is the medium or system through which information is transmitted. Channels connect sender to receiver, and are characterized by their capacity to handle information. This *channel capacity* ( \( C \) ) represents that maximum rate at which information that may reliably be transmitted across that a channel. It places an upper bound on how much information can be sent through such a channel of communication with an arbitrarily low rate of errors, given by:  

\[
C = \max_{p(x)} I(X \ | \ Y)
\]

where \( I(X \ | \ Y) \) is the *mutual information*[^fn02] between the transmitted variable \( X \) and the received variable \( Y \). It measures the amount of information *shared* between \( X \) and \( Y \) or, put another way, how much of what was transmitted by the sender is retained and correctly *understood* by the receiver. The capacity \( C \) for the channel, then, is where maximum amount of information can be correctly transmitted with the fewest number of errors or misunderstandings by the receiver.

[^fn02]: Remember, \( I(x) = - \log_2 p(x) \) is the *surprisal* value of event \( x \) that represents the information conveyed by that event. The *mutual information* between two events can be though of as the information conveyed when *both* events occur simultaneously.

<!-- Need to expand on the descriptions for signal and encoding... -->

Information is transmitted across a communication channel as *signals*, which are encoded representations of the information. To do so, there must be some *system* of encoding the information to be passed along the channel that...

Channels, however, are not perfect. They can introduce disturbances known as *noise*, which interferes with the signal and can alter the received message, creating a challenge in accurate data transmission. The more noise present, the harder it is to reliably convey information. Noise is essentially random disturbances or fluctuations in the transmission of information along a channel that interfere with the signal. Noise can distort or obscure messages, increasing the probability of errors in decoding them.

Since channel capacity is the maximum rate at which information can be transmitted over a channel without errors, excess noise degrades capacity by introducing errors. So, channel capacity depends on both the *bandwidth* of the channel (i.e., the allowable range of possible signal frequencies) and the *signal-to-noise ratio* (often simply called "SNR"). Shannon's theory shows that for a channel to transmit information efficiently, the signal must be strong enough to overcome noise, but *not* so strong that it leads to unnecessary redundancy in the message encodings.

This balance maximizes the channel's capacity, allowing the most efficient transfer of information while minimizing error. This gives us another way[^fn03] to find a channel's capacity, given by:  

\[
    C = B \log_2 \left( 1 + \frac{S}{N} \right)
\]

where \( B \) is the bandwidth of the channel, \( S \) is the power of the signal, and \( N \) is the noise. The the signal-to-noise ratio (SNR) \( \frac{S}{N} \) represents, a measure of how strong the signal is relative to the noise. As noise (\( N \)) gets larger relative to signal (\( S \)), the SNR starts dropping closer towards zero. Since \( \log_2 (1 + 0) = 0 \) that means that, no matter how large its ideal bandwidth, the channel's capacity \( C \) goes towards zero as well.

[^fn03]: This way to calculate channel capacity is more common (and often much more practical) in telecommunication applications, such as those Shannon was studying, in which such things as "channel bandwidth" and "signal power" can be directly measured or otherwise experimentally ascertained.

The influence of telecommunication and cryptography on Shannon's theories are obvious, but the underlying concepts quickly found new applications and implications in other fields of study. By linking information to uncertainty and statistical probabilities, Shannon's abstracted and highly generalized model of information and communication could be adapted to studying all manner of systems. It would not be too long after the theories described in Shannon's technical paper were expanded and republished in book-length form a year later as "The Mathematical Theory of Communication" [@Shannon1949] that they would begin to appear in disciplines ranging form physics to physiology.

## Information Theory in Archaeology

...

## The Limitations of Archaeological Inference

## Evaluating Archaeological Information "Channels"

![Schematic representation of information transmission [Fig. 1 @Justeson1973, p. 133].](Justeson_1973_figure_1.png)

\[
    \left \lbrace (u_1, A_1), \ldots, (u_N, A_N) \right \rbrace
\]

\[
    P \left \lbrace v(u_i) \in A_i \right \rbrace \geqslant 1 - \lambda, i=1, \ldots,N
\]

\[
    C = \max_{\pi} \left \lbrace \sum_j \left \lbrack \sum_i \pi_i w(j|i) \log_2 \sum_i \pi_i w(j|i) - \sum_i \pi_i w(j|i) \log_2 \sum_i \pi_i w(j|i) \right \rbrack \right \rbrace
\]

## Applications

### Extrapolation of the Prehistoric Distribution of Design Elements

\[
    M_t = \sum^{T}_{i=t} N_i
\]

\[
    L_t = \sum^{T}_{i=t} M_i
\]

### Noise

<!-- calculate noise factor for each design element -->

\[
    \begin{aligned}
        \psi(r) &= P(\text{receiving design element r given that r was sent})\\
        &=P(\text{receiving r} \ | \ \text{r was sent})
    \end{aligned}
\]

\[
    \begin{aligned}
    P(A|B) = &P(A \ \text{and} \ B) \div P(B) \text{, so} \\
    &P(\text{r sent} \ | \ \text{r received}) \cdot P(\text{r received})\\
    = &P(\text{r sent and r received})\\
    = &P(\text{r received} \ | \ \text{r sent}) \cdot P(\text{r sent}) \\
    \end{aligned}
\]

\[
    \begin{aligned}
    \min_r \psi(r) &= \min_r P(\text{r received} \ | \ \text{r sent}) \\
    &= \min_r 1 - P(\text{r not received} \ | \ \text{r sent}) \\
    &= \max_r P(\text{r not received} \ | \ \text{r sent}) \\
    &= 1- \lambda
    \end{aligned}
\]

\[
    \begin{aligned}
    \overline{\psi} &= \sum_r p_E(r) \psi(r) \\
    &= \sum_r p_E(r) \left \lbrack p(r) \div p_E(r) \right \rbrack \\
    &= \sum_r p(r) = 1
    \end{aligned}
\]

\[
    \begin{aligned}
    H' &= -\sum_{i=1}^k p(x_i) \log_2 p(x_i) \\
    &= -\sum_{i=1}^k \frac{1}{k} \log_2 \frac{1}{k} \\
    &= -\log_2 \frac{1}{k} \\
    &= \log_2 k
    \end{aligned}
\]

\[
    h = H/H' \ \text{and} \ h_E = H_E/H'_E
\]
