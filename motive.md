# Motivation

## SS-CD

### Pros

- (Quantum) Revocation Version is nice. Allows secret to be stored
  in distributed fashion. Upon revocated reconstruction, servers
  together cannot recover.

- Weaker (Classical) CD variant is meaningful in (t, n) setting. Say
  shares are split between US and Russian servers but if suspicious
  of Russian servers, can ask them to delete. Can still reconstruct
  from US servers.

### Cons

- One may want to reconstruct w/o disturbing the secret-sharing. But
  re-sharing has to be done to achieve this.

- Weaker (Classical) certified deletion doesn't allow for
  reconstruction. In (2, 2) case, it is meaningful only if sharer
  changes their mind.
 

## FHE-CD

### Pros

- Allows Delegated Computation. Revocation version achieves the 
  goal as well as Everlasting security.

### Cons

- Weaker CD variant meaningful only for change of mind, as doesn't
  allow decryption.

- If want computational security, classical FHE is all we need.


## Non-Additive HSS-CD

### Pros

- Allows Delegated Computation w/o compromising secret key at one
  spot.

### Cons

- Basically FHE + SS-CD. FHE-CD needed only for CES.


## Additive HSS

### Pros

- Additive Shares offer Optimal Compactness, as the shares need to
  be the size of the output at least. FHE ciphertexts are much
  larger (they are not |C(s)| but poly(n, |C(s)|)). This is
  important for communication cost.

- Linear Homomorphism of outputs allows things like: 2 hospitals
  secret share their patient data s_1, s_2 between P_1 and P_2. The
  servers compute HSS outputs y_1^1, y_2^1 and y_1^2, y_2^2 which
  are say number of O+ve patients. They can add these and send back
  so someone can learn number of such patients in both hospitals.

- Additive shares are in the correct format for performing secure
  computation. 

### Cons

- Low Computation operation (XOR or Group Add) of Additive
  Reconstruction is not a big deal.


## Additive Weak HSS-CD

### Pros

- Allows secret-shared delegation (secure against breach) as in
  Non-Additive HSS (w/ or w/o CD).

- Output being in shared-way is not main motive (although that
  is nice (and inevitable)). Main thing is input is not compromised
  because it is split/.

- Reconstruction is communication efficient.

- After delegated computation, can delete input data while retaining
  the outputs in shared form. Now, even if servers collude, they
  don't learn input. They will learn evaluated outputs but those can
  reveal small amount of information (like no. of occurrences) which
  is much less sensitive than entire secret data. This is in
  contrast to other definitions where revocation is needed to
  achieve both goals.

- Can simultaneously achieve local information-theoretic security,
  which is meaningful for computational sharing schemes.

- Main disadvantage of current SS-CD schemes is that they are not
  linearly homomorphic unlike classical ones. So if two clients
  share their secrets between two servers, then those cannot be
  combined into a single sharing for instance. However, this
  primitive allows the possibility for obtaining (restricted) info
  from the shares in additive form.

### Cons

- Is meaningless if output evaluations reveal large parts of the
  input. Feels similar to MPC style notion.

- Perhaps there is a better notion that outputs linearly homomorphic
  SS-CD shares (is LH SS-CD even possible?).


## Additive Strong HSS-CD


### Pros

- Overcomes the main limitation of the Weak Notion, i.e., it is
  meaningful for any computation.

- Allows secret-shared delegation (no single breach point). The data
  is secret-shared between the servers and when the client wishes,
  it can ask them to evaluate a function for them. Otherwise, it can
  ask them to delete the data.

- More meaningful with more parties. For example, in a (2, 4),
  say we don't trust part 3 and 4, we can ask them to delete while
  still ensuring 1 and 2 evaluate. Still, not that great.

### Cons

- So basically, it is just an SS-CD scheme (2-out-of-2) which allows
  change of mind on top of delegation.

