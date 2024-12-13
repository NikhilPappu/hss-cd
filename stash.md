
TBD.

\paragraph{Initial Observation:}

Consider an iO circuit $\tlC[f, \pk]$ that outputs $\Enc(\pk, f(x))$
on input $x$. This circuit can be securely leased, i.e., after
deletion, $\qA$ cannot obtain $\tlC[f, \pk](x^*)$ for a
challenge input $x^* \gets \bit^\secp$. This is because $\tlC$ is
indistinguishable from another iO circuit which outputs $\Enc(\pk,
r)$ at $x^*$ from the security of iO. Consequently, the dIO
construction of \cite{} immediately gives us an SSL scheme for
$\tlC$. This is because if $\tlC$ can be evaluated after deletion,
then it is possible to violate dIO-CD of the two aforementioned
circuits trivially. Furthermore, even an unbounded adversary cannot
win as that is the security offered by dIO-CD. Consequently, even if
an adversary is provided with the secret key $\sk$ corresponding to
$\pk$, it should not be able to produce $f(x^*)$.


\paragraph{Why is this helpful to us?:}

Consider an iO circuit $\tlC$ that outputs additive shares of $f$
under $\pk_1, \pk_2$. We can provide $P_1$ with $\sk_1$ and $P_2$
with $\sk_2$. $P_1$ can get one copy of the circuit protected with
the help of dIO-CD while $P_2$ gets another copy. The fact that at a
later point they can obtain the outputs of initial evaluations seems
similar to that of $\sk$ being revealed. However, we need to be
careful because two different dIO-CD programs are separately deleted
and then come together (a semi collusion-resistant setting). Needs
to be carefully analyzed. What if we could instead use a
construction where $P_1$ obtains a PRF-SKL while $P_2$ obtains a
circuit which outputs evaluations masked with this PRF? It seems one
might achieve security with a single deletion here. Still, the
former seems simpler to analyze so we will focus on it first.

\paragraph{To Do:}

\begin{enumerate}
\item $[\;]$ Let $C_0$ be the iO circuit which outputs $Enc(f(x))$ and
$C_1$ be the iO circuit which outputs $Enc(r)$ at a punctured point
$x^*$. Show by adopting techniques of \cite{BGK+23} that given
dIO-CD($C_0$) or dIO-CD($C_1$), statistical indistinguishability holds
after deletion.

\item $[-]$ Consider a setting where two iid copies of either $C_0$
or $C_1$ are provided to non-local adversaries $\qA_0, \qA_1$. If both
copies are deleted and the adversaries come together and spend
unbounded time, they should not be able to tell. This is a weaker
notion than collusion-resistance. In collusion-resistance, a single
party gets access to both dIO-CD circuits upfront. But it might be
easier to argue simply bounded collusion-resistance (maybe can rely on
techniques like ones used in subspace state based copy-protection
schemes) which would automatically imply this.
\textcolor{red}{This bullet is only for sake of understanding. Better
to dive into the main setting described in the next bullet.}


\item $[\;]$ This differs considerably from the above one. Each
adversary has some advantage over the CR adversary because they
have a different secret-key each. Even though $A_0$ can learn
$\sk_1$ by brute-force after deletion, even if it got two copies
it didn't have $\sk_1$ at the beginning. Most probably, we need to
make non-black box use of \cite{BGK+23}'s dIO-CD proof and perhaps
more. To begin with, we should read their Theorem 8.4 and Proof.

\begin{enumerate}
\item One approach is to argue that assuming dIO-CD security,
$\rho_0$ satisfies certain properties. Likewise for $\rho_1$. 
If these properties hold, then we show no unbounded
(although we need only QPT) adversary can differentiate.
Recall how the SS scheme of \cite{BK23} was proven. They used some
XOR lemma that takes into account the fact that even after $\theta$
is provided, adversary cannot distinguish. The problem here is that
the states $\rho_0, \rho_1$ are adversarial states that we know
little about, as opposed to secret-shares that were honestly
generated.

\item Problem is that we cannot use $\qA_2$ to break the dIO-CD
security of either party easily. This is because $\qA_2$ has more
power than the second stage adversary in their respective games.
So the former approach seems more reasonable.
\end{enumerate}

\end{enumerate}

\subsection{Construction}

\begin{description}
\item[$\Sh(P):$] $ $
\begin{enumerate}
\item Sample $k \gets \bit^\secp$ and $(\pk_0, \sk_0), (\pk_1,
\sk_1) \gets \PKE.\Gen(1^\secp)$.
\item Compute $(\qP, \vk) = \dIOCD.\Gen(C)$, where $C$ is the following circuit:
\begin{description}
    \item[\underline{$C(\pk_0, \pk_1, P, k)(x)$}:] $ $
    \begin{itemize}
        \item Compute $r_0, r_1, R$ from $F_k(x)$.
        \item Compute $y_0 = \Enc(\pk_0, R;r_0)$.
        \item Compute $y_1 = \Enc(\pk_1, P(x) \xor R;r_1)$.
        \item Output $y_0, y_1$.
    \end{itemize}
\end{description}
\item Output $\qP_0 = (\qP, \sk_0)$ and $\qP_1 = (\qP, \sk_1)$.
\end{enumerate}


\item[$\Ev(i, \qP_i, x) \ra y_i:$]

\item[$\qDel(i, \qP_i):$]
\item[$\Vrfy(i,\vk_i,\cert_i)$:]
\end{description}

\subsection{Proof Strategy:}

\begin{enumerate}
\item \textbf{Warmup:} Consider $C_0$ to be the iO circuit that
outputs $\Enc(f(x))$ and $C_1$ the iO circuit that outputs
$\Enc(r)$ at a punctured point $x^*$. If we provide dIO-CD$(C_0)$ to
$\qA$ along with secret-key $k$, can it compute $f(x^*)$? If it is
unbounded, then of-course it can, because $f$ can be learned by an
unbounded machine (say $f$ is a PRF). Otherwise, can we break the
security of the PRF, or the dIO-CD security?
\item \textbf{Identify Properties:} What properties must $\rho_0,
\rho_1$ satisfy in order for us to claim that a
QPT second-stage adversary $\qA_2$ cannot compute $P(x^*)$?
\item \textbf{Prove Properties:} Show that if dIO-CD security holds,
then $\rho_0, \rho_1$ satisfy the above properties.
\end{enumerate}

\paragraph{Next Steps:}

\begin{enumerate}
    \item $[*]$ Read the \cite{BGK+23} dIO-CD proof.
    \item $[*]$ Try to prove warmup.
\end{enumerate}

---

\subsection{Impossibility for Unlearnable Functions}

Let us consider the simpler problem of Encrypted Software Leasing
(ESL) first. In ESL, a program $P$ is leased to an adversary $\qA$ via a
quantum state $\qP$. When $\qA$ evaluates $\qP$ on $x$, it
receives the value $\Enc_k(P(x))$ instead of $P(x)$ in the clear as in
SSL. Later, $\qA$ is asked to revoke $\qP$. If it successfully revokes
$\qP$, it receives the key $k$, allowing it to learn the outputs
$P(x)$ of all previous evaluations. However, we want to argue that for
a randomly chosen input $x^*$, it should not be possible for $\qA$ to
output $P(x^*)$, given that $P$ is an unlearnable program.\\

Try to think of an impossibility. Can we come up with
a contrived unlearnable program such that before deletion, the code of
$\qP$ can be used? However, only after $k$ (and hence previous
evaluations) are revealed, should it become possible to learn the
description of $P$.

---

\section{Distributed One-Time Programs}

One time programs allow a form of software leasing where a party is
leased a software that can be evaluated some a-priori bounded number
of times. Deterministic programs cannot be one-time protected.
However, can we split a deterministic one-time program among two
parties such that they can evaluate it in a distributed way only once?
It should be easy to show this is impossible if the parties don't
share entanglement and only have shared randomness. However, it might
be possible by sending them entangled shares of a quantum state that
encodes the program.

\paragraph{To Do}

\begin{enumerate}
\item $[*]$ \textbf{Definition:} Formalize a notion in the style of
[GM24] for the Distributed Setting (Output Format? Can parties
view their evaluations? Can they collude after evaluating?)

\item $[\;]$ \textbf{Feasibility:} Classical Oracle Construction based
on [GLRR24]. All (unlearnable) functions? Use a state of the form
$\sum_{a\in A}\ket{a}\ket{a}$ and oracles which output $G(v)$ and
$G(v) \xor f(x)$. Identify required direct product properties and
check if they are sufficient to argue our security.

\item $[\;]$ \textbf{Impossibility:} Formalize Impossibility for
Unentangled Parties.
\end{enumerate}

\subsection{Definition}

A Distributed One-Time Program (D-OTP) scheme $\DOTP =
(\KG,\TG,\TE)$ has the following syntax:

\begin{description}

\item [Syntax:] $ $
\item $\KG(P) \rightarrow (\tP_0, \tP_1, \sk)$: The key-generation algorithm
outputs two classical programs $\tP_0, \tP_1$ and a secret-key $\sk$.

\item $\TG(\sk) \ra (\qtk_0, \qtk_1)$: The token-generation algorithm takes
in a secret-key and generates (possibly-entangled) quantum tokens
$\qtk_0, \qtk_1$.

\item $\TE(x, \qtk_i, \tP_i) \rightarrow y_i$:
The token-evaluation algorithm takes a token $\qtk_i$, a
program $\tP_i$, and a classical input $x$. It
outputs a classical evaluation-share $y_i$.

\item [Evaluation Correctness:] The following holds for every input
$x$ in the domain of $P$:

\begin{align}
\Pr\left[
y_0 \xor y_1 = P(x)
\ :
\begin{array}{ll}
(\tP_0, \tP_1, \sk) \leftarrow \KG(P)\\
(\qtk_0, \qtk_1) \gets \TG(\sk)\\
\forall i\in\bit: y_i \leftarrow \TE(x, \qtk_i, \tP_i)
\end{array}
\right] \geq 1 - \negl(\secp)
\end{align}
\end{description}

\begin{remark}
Due to the gentle-measurement lemma, the evaluation correctness
implies that the state described by $\qtk_0, \qtk_1$ can be evaluated
on without almost disturbing the state. This seems to contradict any
meaningful notion of one-time security. However, our distributed
notion will make use of the fact that the non-local adversary must
produce a correct distributed evaluation first before collusion is
allowed. Since the tokens $\qtk_0, \qtk_1$ can be entangled, $y_0$ and
$y_1$ can be truly random in a local-sense (even for a fixed global
token state).
\end{remark}


\begin{definition}[One-Time Security]
Consider the following experiment between a challenger $\qCh$ and a
QPT non-local adversary $\qA = (\qA_0, \qA_1, \qA_2)$ for the scheme
$\DOTP = (\KG, \TG, \TE)$ and a program $P$ sampled from distribution
$\cD$:

\begin{description}

\item $\underline{\expb{\DOTP, \qA}{d}{ots}}(1^\secp, P, \cD)$:
\begin{enumerate}
\item $\qCh$ generates $P \gets \cD$, $(\tP_0, \tP_1, \sk) \gets \KG(P)$ and
$(\qtk_0, \qtk_1) \gets \TG(\sk)$.
\item $\qCh$ sends $(\qtk_i, \tP_i)$ to adversary $\qA_i$ for each $i
\in \bit$.
\item For $i \in \bit$, if adversary $\qA_i$ sends a register $R_i$,
run $\tP_i$ on it and measure the output register to get outcome
$y_i$. Send the register $R_i$ to adversary $\qA_2$.
\item Define $y \seteq y_0 \xor y_1$.
\item For each $i \in \bit$, wait to receive register $R_i'$ from
$\qA_2$. Then, run $\tP_i$ on it and measure the output register
to get outcome $y_i'$.

\item Define $y' \seteq y_0' \xor y_1'$.

\item If $y' \neq y$, output $\top$. Else, output $\bot$.
\end{enumerate}
\end{description}

We require the following condition to hold:


$$\Pr\Big[\expb{\DOTP, \qA}{d}{ots}(1^\secp, P) \ra \top\Big]
\le \negl(\secp)$$

\end{definition}

Notice that the above definition allows collusion after the first
distributed evaluation. As per the definition, $P$ can be any
function, even a deterministic one. It remains to be seen which
functions can be one-time protected in this model. At the very least,
$P$ must be unlearnable given a single physical query, as the
``collusion-stage" adversary $\qA_2$ can compute the first evaluation
$y$. The quintessential example would be a PRF family $\{F_k\}_k$,
i.e. $P = F_k$ for $k \gets \bit^\secp$ which is clearly unlearnable
with physical queries.

\begin{remark}
We will also consider a weaker notion $\expc{\DOTP,\qA}{d}{ots}{weak}$
where $R_0, R_1$ are sent back to $\qA_0, \qA_1$ who then send $R_0',
R_1'$. In other words, collusion is never allowed in this variant, so
$\qA_2$ is not part of the experiment.
\end{remark}

\subsection{Construction in the Oracle Model}

We will use the following idealized oracles:
\begin{itemize}
\item Random Oracle $H$.
\item VBB Obfuscation $\Obf$.
\end{itemize}

\begin{description}
\item $\underline{\KG(P)}:$
\begin{itemize}
\item Let $P_0$ be the following program:
\begin{description}
\item $\underline{P_0 (x, v)}:$
\begin{itemize}
\item If $x=0$ and $v \in A$, output $P(x) \xor H(v)$.
\item If $x=1$ and $v \in A^{\perp}$, output $P(x) \xor H(v)$.
\item Else, output $\bot$.
\end{itemize}
\end{description}

\item Let $P_1$ be the following program:
\begin{description}
\item $\underline{P_1 (x, v)}:$
\begin{itemize}
\item If $x=0$ and $v \in A$, output $H(v)$.
\item If $x=1$ and $v \in A^{\perp}$, output $H(v)$.
\item Else, output $\bot$.
\end{itemize}
\end{description}

\item Let $\tP_0 = \Obf(P_0)$ and $\tP_1 = \Obf(P_1)$. Sample a random
subspace $A$ and set $\sk \seteq A$. Output $(\tP_0, \tP_1, \sk)$.
\end{itemize}

\item $\underline{\TG(\sk)}:$
\begin{itemize}
\item Parse $\sk = A$.
\item Prepare a state $\sum_a \ket{a}_{\qreg{P_0}}\ket{a}_{\qreg{P_1}}$ over
registers $\qreg{P_0}$ and $\qreg{P_1}$.
\item Set $\qtk_0, \qtk_1$ to be the states on registers $\qreg{P_0},
\qreg{P_1}$ respectively.
\end{itemize}

\item $\underline{\TE(x, \qtk_i, \tP_i)}:$
\begin{itemize}
\item If $x = 0$, measure $\qtk_i$ in the computational basis to get outcome
$v$.
\item If $x = 1$, TBD.
\item Output $y_i \seteq \tP_i(x, v)$.
\end{itemize}


\end{description}

