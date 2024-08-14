# Heuristic structure optimization of nested dichotomies 

This project contains a python implementation for heuristic generation of nested dichotomies. Several popular algorithms from the literature are included. An efficient algorithm for uniform random sampling of nested dichotomies is also provided.

## Getting started

### Installing

To use this package simple copy it to your project and import:

```
import nd
```
### Usage example
A random nested dichotomy for a problem with 10 classes can be sampled (uniformly at random) as follows:

```
c = 10  # number of classes
lbs = list(range(c))  # corresponding class labels. This should be an integer list with c elements. 
nd2d = nd.RandomGeneration.generate(c, labels=lbs, seed=42)
```
The 'nd2d' will contain the sampled nested dichotomy encoded as a list of integers (tree nodes in preorder). For encoding details see [1]. First, this list has to be parsed into a proper classifier model:

```
nd = nd.NestedDichotomy.parse(nd2d)
```

Now the generated nested dichotomy can be used as usuall multi-class classifier with any probabilistic base learner. Assuming the training data is given as (X, y):

```
from sklearn import tree

# decision stumps as the base learner
base_learner = tree.DecisionTreeClassifier
kwargs = {'max_depth':1}  

#train the model
nd.NestedDichotomy.train(nd, X, y, base_learner, **kwargs)  

#predict using the trained model
y_pred = nd.NestedDichotomy.predict_proba(nd, X_test, c)

```


## Algorithms

All the provided algorithms have the same interface. To generate a nested dichotomy using particular algorithm the corresponding 'generate(...)' method should be called. After that the generated nested dichotomy can be used as described in the previous section.

### Heuristic based on agglomerative clustering (ACND)

A novel structure optimization heuristic based on agglomerative clustering [1].

### Best-of-K heuristic with biased sampling 

Biased version of the Best-of-K heuristic [1].

### Class-balanced nested dichotomies (CBND)

The CBND heuristic proposed by Dong et al. [4] is a top-down approach, mainly aiming at creating NDs with a balanced tree structure.

### Nested dichotomies based on clustering (NDC) 

The structure optimization method suggested by Duarte-Villasenor et al. [3] is a clustering-based heuristic.

### Random-pair selection (RPND)

The random-pair selection heuristic recently proposed by Leathart et al. [2].

## References

[1] Melnikov, V. & Hüllermeier, E. "On the Effectiveness of Heuristics for Learning Nested Dichotomies: An Empirical Analysis", Mach Learn (2018). https://doi.org/10.1007/s10994-018-5733-1

[2] Leathart, T., Pfahringer, B., Frank, E.: "Building ensembles of adaptive nested dichotomies with random-pair selection". In: Machine Learning and Knowledge Discovery in Databases: European Conference, ECML PKDD, 2016

[3] Duarte-Villasenor, M.M., Carrasco-Ochoa, J.A., Martinez-Trinidad, J.F., Flores-Garrido, M.: "Nested dichotomies based on clustering". In: Progress in Pattern Recognition, Image Analysis, Computer Vision, and Applications: 17th Iberoamerican Congress, CIARP, 2012

[4] Dong, L., Frank, E., Kramer, S.: "Ensembles of balanced nested dichotomies for multi-class problems". In: Knowledge discovery in databases, Lecture Notes in Computer Science, 2005


