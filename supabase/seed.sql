insert into public.fprofiles (username, full_name)
values
  ('dark_machine', 'Machine Learning');

select * from fprofiles;

insert into public.tweets (content, id, fprofile_id, parent_id, type)
values
  ('# Build and train a neural network as binary classificator from scratch.

## Questions

-   what is neural network from first principles?
-   what is backward propagation?
-   what is gradient descent?
-   how PyTorch works under the hood?
-   how to visualize data as graphs?

## Prerequisites

-   Basic Python
-   Basic calculus
', 1, 1, NULL, 'project'),
('# Preparation

You can setup your workspace any way you want, as long as it provides an
interactive environment to execute Python code and view generated images. Our
suggestion would be a Jupyter notebook.
', 2, 1, 1, 'milestone'),
('# Expression graph

Implement a general system which provides the ability to compose symbolic
expressions and do compute over them. This will become the foundation of your
neural network.
', 3, 1, 1, 'milestone'),
('# Neural net

Implement a multi-layer neural network and test it on some data. This
abstraction is the gist of the modern machine learning approaches and will help
you better understand more advanced techniques.
', 4, 1, 1, 'milestone'),
('# Conclusion

You''ve just created, trained and used a real neural network. Even though modern
machine learning techniques are different, they have the same core ideas and
understanding those will help you to advance in this field. That said, even this
simple neural network can already be used for a variety of tasks, e.g.
predicting housing prices or recognizing hand-written digits.
', 5, 1, 1, 'milestone'),
('# Install Python

-   install Miniconda3: <https://docs.conda.io/en/latest/miniconda.html>
-   create a project directory: `mkdir my-project && cd my-project`
-   create local python environment: `conda create --prefix ./envs`
-   activate it: `conda activate ./envs`
', 6, 1, 2, 'step'),
('# Create Jupyter notebook

-   install Jupyter: `pip install jupyter`
-   run Jupyter server: `jupyter notebook`
', 7, 1, 2, 'step'),
('# Create Value abstraction

-   it represents a float value
-   it supports addition and multiplication with other Values
    ```python
      x = Value(1.0)
      y = Value(2.0)
      z = Value(3.0)
      (x + y) * z # Value(9.0)
    ```
-   non-leaf values store its operation and arguments
    ```python
      x = Value(1.0)
      y = Value(2.0)
      z = x + y # Value(3.0, op=<addition>, args=<x and y>)
    ```
', 8, 1, 3, 'step'),

('# Visualize the resulting expression graph

-   install GraphViz: `pip install graphviz`
-   import relevant class: `from graphviz import Digraph`
-   draw the expression graph:
    -   create graph object
        ```python
            dot = Digraph()
        ```
    -   add Value nodes to graph
        ```python
            dot.node(
                name, # unique node identifier
                label, # contents of the node, format depends on the shape
                shape, # visual shape of the nod
            )
            # dot.node(name=''a'', label=f''{{ a | {a:.4f} }}'', shape=''record'')
        ```
    -   connect argument nodes to the output nodes
        ```python
            dot.edge(
                name_from, # source node name
                name_to, # destination node name
            )
            # dot.edge(''a'', ''b'')
        ```
    -   given expression `(x + y) * z`

        -   your graph can look like this

        {{< figure src="/ox-hugo/l1-simple-graph.svg" >}}

        -   or like this

        {{< figure src="/ox-hugo/l1alt-simple-graph.svg" >}}
', 9, 1, 3, 'step'),

('# Implement gradient calculation

-   gradient is a partial derivative of the final expression
    with respect to the current expression
    ```python
      x = Value(1.0)
      y = Value(2.0)
      z = Value(3.0)
      u = x + y
      v = u * z
    ```

\begin{align}
\text{grad}(v) = \frac{dv}{dv} &= 1\\\\\[5pt]
\text{grad}(u) = \frac{dv}{du} &= \frac{d(u \cdot z)}{du}=z\\\\\[5pt]
\text{grad}(x) = \frac{dv}{dx} &= \frac{dv}{du} \cdot \frac{du}{dx} = z \cdot \frac{d(x + y)}{dx} = z \cdot 1 = z
\end{align}

-   implement `backward()` method which computes the gradients of the whole graph
    when called on the root node
-   hints:
    -   when creating a new Value as a result of some operation, define
        `self._backward` lambda which updates gradients of the argument nodes
    -   consider a case when some Value is used twice
', 10, 1, 3, 'step'),

('# Implement more operations

-   subtraction: `x - y = x + (y * -1)`
-   power: `x**k` where `k` is a constant (not a Value)
-   division: `x/y = x * (y**-1)`
-   exp: `x.exp()`
-   tanh: `x.tanh()`
', 11, 1, 3, 'step'),
('# Create and test expression graph for a single neuron

```python
x1 = Value(2.0, label=''x1'')
x2 = Value(0.0, label=''x2'')
w1 = Value(-3.0, label=''w1'')
w2 = Value(1.0, label=''w2'')
b = Value(6.8814, label=''b'')
x1w1 = x1 * w1; x1w1.label = ''x1*w1''
x2w2 = x2 * w2; x2w2.label = ''x2*w2''
x1w1x2w2 = x1w1 + x2w2; x1w1x2w2.label = ''x1*w1 + x2*w2''
n = x1w1x2w2 + b; n.label = ''n''
o = n.tanh(); o.label = ''o''
o.backward()
# ==== expected gradients ====
# x1.grad = -1.5
# w1.grad = 1.0
# x2.grad = 0.5
# w2.grad = 0.0
```
', 12, 1, 3, 'step')
;

select * from tweets;

select * from tweets_full;
