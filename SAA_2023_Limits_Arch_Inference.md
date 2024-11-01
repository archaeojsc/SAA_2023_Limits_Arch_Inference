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

Under Shannon's model of communication [-@Shannon1948], the relationships between information, channel, signal, noise, and channel capacity define the core aspects for transmitting data effectively. Information represents the content or message that needs to be conveyed, which can vary in complexity. In this context, entropy is a measure of the inherent complexity of the information a message might contain -- i.e., higher entropy indicates greater variability in *potential* messages. A communication *channel* is the medium through which information is transmitted. *Signal* refers to some system of *encoding* for that information, which can be passed along the channel. These encodings are comprised of some method for systematically transforming information into signals that can be effectively transmitted, effectively codifying distinct events or features that can be described in terms of their individual probabilities.

Channels, however, are not perfect. They can introduce disturbances known as *noise*, which interferes with the signal and can alter the received message, creating a challenge in accurate data transmission. The more noise present, the harder it is to reliably convey information. Shannon introduced the concept of *channel capacity* to describe the maximum rate at which information can be transmitted over a channel with a given noise level and still be reliably decoded by the receiver. This capacity depends on both the *bandwidth* of the channel and the *signal-to-noise ratio* (often simply called "SNR"). Shannon's theory shows that for a channel to transmit information efficiently, the signal must be strong enough to overcome noise, but not so strong that it leads to unnecessary redundancy. This balance maximizes the channel's capacity, allowing the most efficient transfer of information while minimizing error.

...

<!-- In Shannon's theory of communication, **information** represents a reduction in uncertainty, quantified through **entropy**, which measures the unpredictability of a source. Entropy, \( H(X) \), is a central concept that quantifies the average information content of messages from a source, considering the probabilities of various possible outcomes. Higher entropy indicates greater uncertainty and, thus, more potential information content per symbol. Shannon formalized entropy as 

\[
H(X) = -\sum p(x) \log p(x)
\]

where \( p(x) \) is the probability of each possible message. This value gives the expected amount of information produced by a source, reflecting the variability and richness of its output.

**Channels** are the conduits through which information is transmitted from sender to receiver and are characterized by their capacity to handle information. **Channel capacity**, \( C \), represents the maximum achievable rate (in bits per second) at which information can be reliably transmitted over the channel. Shannon defined channel capacity as the upper bound on the transmission rate where information can be sent with arbitrarily low error, given by 

\[
C = \max_{p(x)} I(X; Y)
\]

where \( I(X; Y) \) is the **mutual information** between the transmitted variable \( X \) and the received variable \( Y \). This mutual information measures the amount of information shared between \( X \) and \( Y \), capturing how much of the sent signal is retained and understood at the receiving end.

**Signals**, the encoded representations of information, travel through channels but are often affected by **noise** -- random disturbances or fluctuations that interfere with the signal. Noise can distort or obscure the signal, increasing the probability of errors in decoding. Shannon introduced the concept of noise through the “noisy channel model,” which includes the **signal-to-noise ratio** (SNR) as a factor affecting capacity. The capacity of a noisy channel is maximized by encoding strategies that adapt to the noise level, thereby improving the reliability of transmission by maximizing mutual information despite interference.

Thus, the interplay among information, entropy, channel, signal, noise, and capacity defines the limitations and possibilities for communication. The channel capacity sets a theoretical upper limit, dictated by entropy and SNR, on how much information can be sent reliably, while noise and entropy influence the encoding methods necessary to approach this capacity. Shannon’s framework demonstrates that efficient communication requires managing these relationships to optimize the flow of information within the constraints of the channel and the presence of noise.
 -->

<!-- In Shannon's "A Mathematical Theory of Communication," the concepts of channel, channel capacity, signal, and noise are foundational to understanding how information is transmitted over communication systems.

1. **Channel**: This refers to the medium or system through which information (in the form of signals) is sent from a sender to a receiver. A channel can be anything from a wire in a telephone system to a fiber optic line or even a wireless spectrum. Shannon modeled channels mathematically to analyze how they affect transmitted signals.

2. **Signal**: The signal represents the actual information that is being communicated, whether it's voice, data, or video. In Shannon's framework, a signal is encoded as a sequence of symbols (e.g., binary digits 0s and 1s) that are transmitted over the channel.

3. **Noise**: Noise refers to any unwanted interference or disturbance that distorts the signal as it passes through the channel. Noise can result from physical factors like electrical interference or from limitations in the transmission medium itself. Shannon considered this interference mathematically as random processes that alter the transmitted signals unpredictably.

4. **Channel Capacity**: This is a critical concept that defines the maximum rate at which information can be reliably transmitted over a channel, given the presence of noise. Mathematically, Shannon's formula for channel capacity \( C \) is:

\[
    C = B \log_2 \left( 1 + \frac{S}{N} \right)
\]

where \( B \) is the bandwidth of the channel (in Hz), \( S \) is the signal power, and \( N \) is the noise power. The term \( \frac{S}{N} \) represents the signal-to-noise ratio (SNR), a measure of how strong the signal is relative to the noise. The capacity \( C \) gives the maximum number of bits per second that can be transmitted with minimal error, despite the noise.

In simple terms, Shannon's theory explains how much information can be transmitted over a given channel, taking into account the inevitable noise that distorts signals, and provides a formula for maximizing the efficiency of communication systems. -->

<!-- ## Quantitative Analysis and Information Theory in Archaeological Methodology

The integration of quantitative methods into archaeology during the 20th century marked a transformative era that would challenge, redefine, and diversify approaches to understanding the past. By the 1950s, foundational works by @Brainerd1951 and @Heizer1956 highlighted the value of statistical frameworks in chronology-building and site analysis, establishing a precedent for rigorous quantitative inquiry in archaeology. This push intensified during the 1960s with the advent of New Archaeology, championed by figures such as Lewis Binford. New Archaeology, later termed Processual Archaeology, advocated for an explicitly scientific approach grounded in hypothesis testing, formal quantification, and systems theory @Binford1981; @Raab1984]. David Clarke's *Analytical Archaeology* [-@Clarke1978] encapsulated this era's aspirations by advocating for complex statistical models and systems theory to provide explanatory frameworks in the study of past human behavior. By situating quantitative methods at the heart of analysis, Processual Archaeology sought to go beyond mere description to causal understanding, particularly through middle-range theories that sought correlations between artifacts and behavioral processes [@Schiffer1983].

By the 1970s, quantitative archaeology had begun to incorporate Shannon's information theory, pioneered by Doran's [-@Doran1970] early application of systems theory and simulation. @Justeson1973 explored information-theoretic concepts as a tool for addressing inferential challenges in archaeology, positing that entropy measures could quantify cultural complexity and inform hypothesis testing. The development of computer applications further fueled this expansion, facilitating the adoption of statistical methods across archaeological contexts [@Richards1998; @Djindjian2015]. This application of information theory allowed archaeologists to assess patterns in artifact distribution and site organization with new mathematical precision, later inspiring applications in cultural transmission and inter-group interaction studies [@Dickens1984]. Through the 1980s, the critique of rigid, quantifiable approaches to cultural phenomena began to emerge, primarily from post-processual theorists who argued for subjective interpretations and a focus on agency and meaning rather than structural functionalism [@Klejn1977].

Despite critiques, quantitative methods, including information-theoretic approaches, continued to evolve. In recent years, advances in entropy and information measures have been increasingly applied to lithic analysis, as seen in works such as @Paige2022 or @Rio2024, who employed entropy to examine variability in stone tool production strategies. These newer studies align with a trend towards recognizing the flexibility of quantitative tools to address a broader array of archaeological questions, marking a shift away from the purely deterministic frameworks of early Processualism towards a more nuanced integration within contemporary theoretical paradigms [@Nolan2020; @Gheorghiade2023].

From the 1960s to today, the trajectory of quantitative analysis in archaeology has seen waves of theoretical support and critique. Early Processualism lauded quantitative rigor for its perceived objectivity, while post-processual scholars raised concerns about the reductionist tendencies of such models. Over time, however, quantitative methods—including applications of Shannon's information theory—have found renewed relevance as tools capable of balancing empirical rigor with interpretative flexibility, a balance increasingly valued in today's archaeological discourse. -->

<!-- ### Source Analysis

| No. | Source | Key Insight | Citations |
|-----|---------|-------------|------------|
| 1 | [Aldenderfer (1998)](https://doi.org/10.1007/bf02446161) | Reviews the development of quantitative methods and their evolution in archaeological studies. | - |
| 2 | [Ammerman (1992)](https://doi.org/10.1146/annurev.an.21.100192.001311) | Examines the impact of quantitative methods on archaeological theory and practice since the 1960s. | - |
| 3 | [Binford (1981)](https://doi.org/10.1086/jar.37.3.3629723) | Advocates for a scientific approach to archaeology via Processualism and middle-range theory. | - |
| 4 | [Brainerd (1951)](https://doi.org/10.2307/276979) | Establishes statistical chronology techniques foundational to quantitative archaeology. | - |
| 5 | [Justeson (1973)](https://doi.org/10.2307/279360) | Early application of Shannon's information theory to address archaeological inference limits. | - | -->

<!-- ## The Role of Quantitative Analysis in Archaeology: A Historical Perspective

The integration of quantitative analysis and mathematical models in archaeology has profoundly shaped the field, particularly within the New Archaeology and Processual Archaeology movements from the 1960s to the present. In response to dissatisfaction with traditional cultural-historical archaeology, which often emphasized descriptive and typological methods, practitioners in the New Archaeology movement sought to make archaeology more scientific and explanatory. This transformation led to the adoption of quantitative methods and mathematical models to generate empirical, testable hypotheses about past human behavior. A pioneering work in this domain, Heizer and Cook's [-@Heizer1956] exploration of the quantitative approach, laid the groundwork for these methods in archaeology, positing that numerical data and statistical analysis could lead to more objective interpretations of archaeological evidence.

David Clarke's *Analytical Archaeology* [-@Clarke1978] exemplified the push for rigorous, mathematically grounded methods, highlighting how quantification could help establish generalizable patterns across different cultural contexts. Clarke's work strongly influenced subsequent theorists, such as Lewis Binford, a prominent advocate of Processual Archaeology, who argued that archaeological interpretations could be systematized through mid-range theories that bridge human behavior and material remains [@Binford1981]. Quantitative methods became a key tool in Processual Archaeology, enabling archaeologists to test hypotheses about social organization, economic systems, and technological development. Scholars like @Clark1982 provided historical perspectives on this shift, noting that the inclusion of quantitative analysis allowed for greater precision in understanding the variability in artifact distributions, settlement patterns, and environmental adaptations.

During the late 20th century, statistical methods and computer modeling expanded in utility, incorporating systems theory and computer simulations to model cultural processes over time [@Doran1970]. Mark Aldenderfer [-@Aldenderfer1998] reviewed the evolution of these methods, documenting how developments in computing and software had facilitated complex simulations and analyses that were previously unattainable. Notably, the integration of Geographic Information Systems (GIS) allowed archaeologists to spatially analyze artifact distribution and settlement patterns, revealing previously hidden relationships within archaeological data [@Richards1998. Information-theoretic approaches, inspired by advancements in information science, also began to influence archaeology in this period. @Justeson1973 and @Dickens1984 used these methods to study cultural interactions and artifact variability, suggesting that information entropy could provide a framework for understanding the complexity of archaeological datasets.

Despite these advances, quantitative methods have not been without critique. Post-processual archaeologists in the 1980s and 1990s argued that the quantitative focus of Processual Archaeology overlooked subjective and symbolic aspects of human culture. Critics like @Schiffer1988 contended that strict reliance on quantitative methods risked simplifying human behavior and failing to account for cultural context and agency. In response, the early 21st century saw a resurgence of interest in interpretive approaches, balancing the objectivity of quantitative analysis with an understanding of the nuanced social and symbolic dimensions of past cultures [@Djindjian2015].

Recent trends in quantitative archaeology reflect a synthesis of these perspectives, integrating information theory, entropy measures, and network analysis to model archaeological data in new ways [@Gheorghiade2023; @Nolan2020]. Current research by @Paige2022 exemplifies this integration, applying entropy to understand lithic reduction strategies and revealing insights into ancient cognitive processes. These advancements indicate a broader trend towards using quantitative methods as one part of a multidisciplinary approach to archaeology, acknowledging the value of both empirical rigor and cultural interpretation.

The evolution of quantitative analysis in archaeology underscores its pivotal role in transforming the field, yet it also highlights ongoing debates over objectivity, interpretation, and cultural complexity. As technology and theoretical perspectives continue to evolve, quantitative methods will likely remain an essential, though contested, part of archaeological research, bridging scientific analysis with cultural interpretation to reveal deeper insights into the human past. -->

<!-- ### Source Analysis

| No. | Source | Key Insight | Citations |
|-----|---------|-------------|------------|
| 1 | [Aldenderfer (1998)](https://doi.org/10.1007/bf02446161) | Reviews advancements in quantitative methods, noting their growing complexity with computational power | 2 |
| 2 | [Ammerman (1992)](https://doi.org/10.1146/annurev.an.21.100192.001311) | Discusses the role of statistical methods in developing archaeological explanations | 1 |
| 3 | [Binford (1981)](https://doi.org/10.1086/jar.37.3.3629723) | Advocates for quantitative methods in Processual Archaeology, stressing hypothesis testing | 3 |
| 4 | Clarke (1978) | Argues for rigorous, scientific analysis in archaeology, influencing New Archaeology methods | 2 |
| 5 | [Djindjian (2015)](https://doi.org/10.2307/jj.15135883.4) | Highlights the success of mathematical approaches in contemporary archaeology | 1 | -->

## Information Theory in Archaeology

...

<!-- ### The Evolution and Critical Debate of Information Theory in Archaeology -->

<!-- The integration of information theory into archaeological research has evolved significantly since its early application. Inspired by Shannon's ideas, archaeologists began to employ these concepts to analyze the transmission of cultural traits, the integrity of artifacts, and the uncertainty inherent in archaeological data. However, the application of these ideas has sparked substantial debate regarding their limitations in addressing the complexities of human behavior and cultural evolution.

Michael Schiffer's pioneering work [-@Schiffer1972] marked one of the earliest uses of information theory in archaeology, where he explored the disruption of information flow caused by post-depositional processes, termed as "systemic and archaeological contexts." Schiffer emphasized how the information contained within artifacts could degrade over time due to various environmental and cultural factors, introducing "noise" into the archaeological record. This idea aligned with Shannon's theory of communication, where noise distorts messages as they pass through a channel. Schiffer's subsequent work [-@Schiffer1983] on formation processes expanded on this, demonstrating how entropy, a measure of disorder, influences the amount of reliable information that survives in archaeological contexts.

Michael Schiffer's seminal work "Formation Processes of the Archaeological Record" [-@Schiffer1987] is among the most influential applications of information theory concepts to archaeology, even though Schiffer did not explicitly use Shannon's framework. Schiffer introduced the idea that archaeological sites are the result of two key processes: cultural formation processes, which involve human behaviors that create and modify archaeological deposits, and natural formation processes, which are the non-human agents, such as erosion or animal activity, that affect the archaeological record.

The notion of information loss in these processes echoes Shannon's concepts of entropy and noise. Schiffer's emphasis on understanding how archaeological data are transformed before and after deposition mirrors the concerns of information theory regarding how signals are distorted through transmission. By conceptualizing the archaeological record as a series of transformations from its original state, Schiffer advanced a model that paralleled information processing, where each formation process acts as a filter, introducing "noise" and altering the original "message."

John Justeson [-@Justeson1973] applied Shannon's concepts more directly to archaeological inference, investigating the limitations of reconstructing past human behavior through fragmentary data. He focused on how entropy could quantify uncertainty and signal degradation, critiquing the oversimplification that sometimes results when human complexity is reduced to mathematical models. This early work identified the tension between abstract, quantitative frameworks and the nuances of cultural history, a critique that has persisted in the field.

John Justeson's "Limitations of Archaeological Inference" [-@Justeson1973] explicitly drew on Shannon's ideas, applying them to the challenges archaeologists face in reconstructing past human behaviors from material remains. Justeson argued that archaeological interpretation is fundamentally limited by the quantity of information that can be extracted from the archaeological record.

He framed the archaeological record as a degraded and incomplete set of signals, with each artifact or feature representing a small, noisy fraction of the original cultural system. Justeson applied Shannon's concept of entropy to assess the degree of uncertainty in archaeological interpretations, highlighting how increasing entropy in the archaeological record—due to processes such as taphonomy or excavation biases—leads to more ambiguous or unreliable interpretations.

Justeson's work helped establish a dialogue within archaeology about the inherent limitations of inference from incomplete datasets, contributing to the development of more cautious and methodologically rigorous approaches to interpreting the archaeological record. His use of Shannon's ideas encouraged archaeologists to critically evaluate the reliability of their data and the extent to which they could justifiably infer past behaviors or cultural practices.

In the 1980s, other scholars applied information theory to model cultural interaction. @Dickens1984 used Shannon's idea of channel capacity to study the flow of cultural information in the Middle Woodland Period, seeking to quantify how much cultural interaction could be detected within the archaeological record. Similarly, @Renfrew1983 explored the idea of culture as a communication system, where information flows between individuals and groups. He applied Shannon's concept of information transmission to study how cultural signals travel and degrade over time, though he acknowledged the complexity of non-linear dynamics in human societies, which challenge the assumptions of equilibrium-based models.

By the 21st century, the use of information theory in archaeology had broadened, particularly in studies of cultural transmission. @Crema2016 advanced Shannon's ideas by applying equilibrium and non-equilibrium models to study cultural transmission from frequency data. They used these models to reveal how cultural traits spread and stabilize within populations, providing quantitative insights into processes that are often difficult to observe directly in the archaeological record. Similarly, @Carrignon2023 used information theory to estimate transmission rates, applying Shannon's communication model to measure the uncertainty associated with the diffusion of cultural traits.

A major critique of these applications, as articulated by Raab and Goodyear (1984), concerns the oversimplification of human behaviors when abstract models like those derived from Shannon's theories are applied. They argue that middle-range theory, which often uses these models, fails to capture the full complexity of human action. @Zubrow1972 similarly critiqued the difficulty of accounting for environmental and social variables when applying information-theoretic frameworks. Despite this, modern scholars such as @Nolan2020 have worked to refine these models. Nolan assessed entropy, noise, and channel capacity to evaluate the significance of archaeological data, particularly focusing on how much information about past societies could be accurately recovered from the fragmented and noisy record.

More recently, @Gheorghiade2023 expanded Shannon's concept of entropy into a framework they called "Entropology," which applies entropy measures to better understand archaeological data. They critique the traditional applications of information theory for focusing too narrowly on entropy without accounting for the broader complexity and uncertainty of archaeological contexts. This critique echoes the central debate surrounding the use of information theory in archaeology: while it offers valuable tools for formalizing the study of cultural transmission and data integrity, it often struggles to capture the intricate and chaotic nature of human history.

In summary, the use of Shannon's information theory in archaeology has evolved from early models of data degradation and cultural transmission to more sophisticated frameworks that incorporate entropy and uncertainty. Scholars like Schiffer, Justeson, and Renfrew laid the foundation, while modern researchers like Nolan, Crema, and Gheorghiade have expanded these concepts to address the challenges posed by incomplete and noisy archaeological records. However, the ongoing debate highlights the tension between the precision offered by information theory and the complex realities of human history, questioning the extent to which these mathematical models can truly capture the richness of the past.

| #  | Paper                                                                                      | Key Insight                                                                                                                                              | Citations |
|----|---------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|-----------|
| 1  | [Crema, Kandler & Shennan (2016)](https://doi.org/10.1038/srep39122)                        | Applied equilibrium and non-equilibrium models to cultural transmission, revealing cultural patterns through frequency data.                               | -         |
| 2  | [Justeson (1973)](https://doi.org/10.2307/279360)                                           | Explored the limitations of information theory in archaeological inference, emphasizing the role of noise and uncertainty in reconstructing behavior.       | -         |
| 3  | [Nolan (2020)](https://doi.org/10.1007/s11135-020-00980-0)                                  | Assessed entropy, noise, and channel capacity in evaluating the significance of archaeological data and its degradation over time.                         | -         |
| 4  | [Schiffer (1972, 1983)](https://doi.org/10.2307/278203)                                     | Investigated how post-depositional processes disrupt information flow in artifacts, introducing the concept of formation processes in archaeological theory.| -         |
| 5  | [Carrignon, Bentley & O'Brien (2023)](https://doi.org/10.1016/j.jaa.2023.101545)            | Used information theory to estimate cultural transmission rates and measure the uncertainty in archaeological data.                                        | -         |
| 6  | [Raab & Goodyear (1984)](https://doi.org/10.2307/280018)                                    | Critiqued the over-reliance on middle-range theories and abstract models in capturing the complexity of human behaviors in archaeological records.          | -         |
| 7  | [Gheorghiade et al. (2023)](https://doi.org/10.1007/s10816-023-09627-4)                    | Proposed the concept of "Entropology" to move beyond simple entropy measures, emphasizing the need to account for complexity and uncertainty in the data.    | -         | -->

## The Limitations of Archaeological Inference

## Evaluating Archaeological Information "Channels"

![Schematic representation of information transmission [Fig. 1 @Justeson1973, p. 133].](Justeson_1973_figure_1.png)

\[
    \biggl \lbrace (u_1, A_1), \ldots, (u_N, A_N) \biggr \rbrace
\]

\[
    P \big \lbrace v(u_i) \in A_i \big \rbrace \geqslant 1 - \lambda, i=1, \ldots,N
\]

\[
    C = \max_{\pi} \left\lbrace \sum_j \left\lbrack\sum_i \pi_i w(j|i) \log_2 \sum_i \pi_i w(j|i) - \sum_i \pi_i w(j|i) \log_2 \sum_i \pi_i w(j|i)\right\rbrack \right\rbrace
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
