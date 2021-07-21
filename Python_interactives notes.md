# Python Plotting
Find limx→0sin(x)x.

Run code block in SymPy Live
limit(sin(x)/x, x, 0)


## install


Using:
`py -m pip install matplotlib`

            Installing collected packages: numpy, kiwisolver, six, python-dateutil, cycler, certifi, pyparsing, pillow, matplotlib


Also installed sympy
pyglet
mpmath
pandas

## Plotting a function

[From](https://matplotlib.org/gallery/lines_bars_and_markers/simple_plot.html#sphx-glr-gallery-lines-bars-and-markers-simple-plot-py)

```py

import matplotlib
import matplotlib.pyplot as plt
import numpy as np

# Data for plotting
t = np.arange(0.0, 2.0, 0.01)  #range from 0-2
s = 1 + np.sin(2 * np.pi * t)

fig, ax = plt.subplots()
ax.plot(t, s)

#Labeling
ax.set(xlabel='time (s)', ylabel='voltage (mV)',
       title='About as simple as it gets, folks')

#Add a grid
ax.grid()

#Save the image
fig.savefig("test.png")
plt.show()

```

## Installed Neuron

Interactive Env.

[Github Site](https://github.com/neuron-team/vscode-ipe/wiki)



Installing collected packages: ipython-genutils, traitlets, pywin32, jupyter-core, tornado, pyzmq, jupyter-client, decorator, parso, jedi, backcall, colorama, pygments, pickleshare, wcwidth, prompt-toolkit, ipython, ipykernel, jupyter-console, pycparser, cffi, argon2-cffi, MarkupSafe, jinja2, pyrsistent, attrs, jsonschema, nbformat, pywinpty, terminado, prometheus-client, defusedxml, webencodings, packaging, bleach, pandocfilters, testpath, entrypoints, mistune, nbconvert, Send2Trash, notebook, widgetsnbextension, ipywidgets, qtpy, qtconsole, jupyter

Installed sympy


Example... doesnt run
```py 
from plotly.offline import download_plotlyjs, init_notebook_mode, plot, iplot

from plotly.graph_objs import Scatter, Figure, Layout
init_notebook_mode(connected=True)


iplot([{"x": [1, 2, 3], "y": [3, 1, 6]}])



from plotly.offline import download_plotlyjs, init_notebook_mode, plot, iplot

import plotly.graph_objs as go

import pandas as pd

# Read data from a csv
z_data = pd.read_csv('https://raw.githubusercontent.com/plotly/datasets/master/api_docs/mt_bruno_elevation.csv')

data = [
    go.Surface(
        z=z_data.as_matrix()
    )
]
layout = go.Layout(
    title='Mt Bruno Elevation',
    autosize=False,
    width=500,
    height=500,
    margin=dict(
        l=65,
        r=50,
        b=65,
        t=90
    )
)
fig = go.Figure(data=data, layout=layout)
iplot(fig)



from plotly.offline import download_plotlyjs, init_notebook_mode, plot, iplot

import plotly.graph_objs as go


z1 = [
    [8.83,8.89,8.81,8.87,8.9,8.87],
    [8.89,8.94,8.85,8.94,8.96,8.92],
    [8.84,8.9,8.82,8.92,8.93,8.91],
    [8.79,8.85,8.79,8.9,8.94,8.92],
    [8.79,8.88,8.81,8.9,8.95,8.92],
    [8.8,8.82,8.78,8.91,8.94,8.92],
    [8.75,8.78,8.77,8.91,8.95,8.92],
    [8.8,8.8,8.77,8.91,8.95,8.94],
    [8.74,8.81,8.76,8.93,8.98,8.99],
    [8.89,8.99,8.92,9.1,9.13,9.11],
    [8.97,8.97,8.91,9.09,9.11,9.11],
    [9.04,9.08,9.05,9.25,9.28,9.27],
    [9,9.01,9,9.2,9.23,9.2],
    [8.99,8.99,8.98,9.18,9.2,9.19],
    [8.93,8.97,8.97,9.18,9.2,9.18]
]

z2 = [[zij+1 for zij in zi] for zi in z1]
z3 = [[zij-1 for zij in zi] for zi in z1]

data = [
    go.Surface(z=z1),
    go.Surface(z=z2, showscale=False, opacity=0.9),
    go.Surface(z=z3, showscale=False, opacity=0.9)

]

iplot(data,filename='python-docs/multiple-surfaces')

```



## Sympy works well

[Docs](https://docs.sympy.org/latest/modules/plotting.html)



    Plotting a single expression with a single range.

        plot(expr, range, **kwargs)

    Plotting a single expression with the default range (-10, 10).

        plot(expr, **kwargs)

    Plotting multiple expressions with a single range.

        plot(expr1, expr2, ..., range, **kwargs)

    Plotting multiple expressions with multiple ranges.

        plot((expr1, range1), (expr2, range2), ..., **kwargs)

Example 1:

```py
from sympy import symbols

from sympy.plotting import plot

x = symbols('x')
p1
p1=plot(1/(x*x))
p1.show

```

This works for powers:

`p3=plot(pow(x,2))`

Any global option can be specified as a keyword argument.

The global options for a figure are:

- title : str
- xlabel : str
- ylabel : str
- legend : bool
- xscale : {‘linear’, ‘log’}
- yscale : {‘linear’, ‘log’}
- axis : bool
- axis_center : tuple of two floats or {‘center’, ‘auto’}
- xlim : tuple of two floats
- ylim : tuple of two floats
- aspect_ratio : tuple of two floats or {‘auto’}
- autoscale : bool
- margin : float in [0, 1]
- backend : {‘default’, ‘matplotlib’, ‘text’}

Aesthetics:

    line_color : function which returns a float.

options:

    label : str

    steps : bool

    integers_only : bool

SurfaceOver2DRangeSeries, ParametricSurfaceSeries support the following:

aesthetics:

    surface_color : function which returns a float.


```py
fz = x**2-y**2

Fx, Fy, Fz = fz.diff(x), fz.diff(y), 0

p[1] = fz, 'style=solid'

p[1].color = (Fx**2 + Fy**2 + Fz**2)**(0.5)

```


To see lots of plotting examples, see examples/pyglet_plotting.py and try running it in interactive mode (python -i plotting.py):

$ python -i examples/pyglet_plotting.py

## USing sympy.

[Good Doc Starting](https://docs.sympy.org/latest/index.html)
[Basic Examples](https://docs.sympy.org/latest/tutorial/intro.html#the-power-of-symbolic-computation)




This was way in the weeds:

[Plotting Func Ref](https://docs.sympy.org/latest/modules/plotting.html#plotting-function-reference)


1. Starting out:

              from sympy import symbols

              from sympy.plotting import plot

       if you need sin cos

              from sympy import symbols, cos, sin
              
       or all of it:
              
              from sympy import *
       
       The abc module imports all latin and greek letters as symbols


              from sympy.abc import x, y

       instead of the slightly more clunky-looking

              from sympy import symbols

x, y = symbols('x y')
2. Define Variables 

                     x = symbols('x')
                     y=symbols('y')

3. Define a plot object

                      p = Plot(visible=False)

       or here it is defined with the symbols

                     p1 = plot(x*x, show=False)

                     p2 = plot(x, show=False)


4. Plot 

       plot((x**2, (x, -6, 6)), (x, (x, -5, 5)))
       plot_parametric(cos(u), sin(u), (u, -5, 5))

       plot_parametric needs a function along x along with a function along y

       Confusingly there is a Plot class `sympy.plotting.plot.Plot` and a plot class `sympy.plotting.plot.plot`.  The doc says: 
       
              For interactive work the function plot is better suited.


Add one plot to another: `p1.extend(p2)`


Theres this example that uses pyglet:

              from sympy import var, Plot
              var('x y z')
              Plot(x*y**3-y*x**3)

!!! Example This Shows the promise:

              >>> x = Symbol('x')
              >>> limit(sin(x)/x, x, 0)
              1
              >>> integrate(1/x, x)
              log(x)
              >>> 


Sympy solves things symbolically:


              import sympy
              sympy.sqrt(3)
              sqrt(3)
              sympy.sqrt(8)
              2*sqrt(2)

 variables are defined using symbols. U

```py
              from sympy import symbols
              x, y = symbols('x y')
              expr = x + 2*y
              expr
             #>> x + 2*y
             expr + 1
              #>> x + 2*y + 1
              expr - x
              #2*y
              x*expr
              #x*(x + 2*y)


```

, we might have expected x(x+2y) to transform into x^2^+2xy, most simplifications are not performed automatically. 

To handle:

```py
from sympy import expand, factor

expanded_expr = expand(x*expr)

expanded_expr
##x**2 + 2*x*y

factor(expanded_expr)
#x*(x + 2*y)
```


[Doc](https://docs.sympy.org/latest/tutorial/intro.html#the-power-of-symbolic-computation)

It can also output in Latex



## Using Jupyter


Start with 
Column A | Column B | Column C
---------|----------|---------
 A1 | B1 | C1
 A2 | B2 | C2
 A3 | B3 | C3
`jupyter notebook` ==
`jupyter-notebook`


See the kernals installed

                     jupyter kernelspec list

To create a `jupyter_notebook_config.py` file in the .jupyter directory, with all the defaults commented out, use the following command: 

    $ jupyter notebook --generate-config

:ref:`Command line arguments for configuration <config>` settings are
documented in the configuration file and the user documentation.

Trying to open a notebook - it will ask for a token:

jupyter notebook list

to get them


1/3) Installing via CRAN

You can install all packages using the following lines in an R console:

              install.packages('IRkernel')  # Don’t forget step 2/3!

To update the IRkernel package, use update.packages()
2/3) Making the kernel available to Jupyter

If you haven’t done this already, you will have to make Jupyter see the newly installed R kernel by installing a kernel spec.

The kernel spec can be installed for the current user with the following line from R:

              IRkernel::installspec()

To install system-wide, set user to False in the installspec command:

              IRkernel::installspec(user = FALSE)

3/3) Make useful shortcuts available

If you use Jupyter lab (and you should!), install Ryan Homer’s text-shortcuts extension:

              jupyter labextension install @techrah/text-shortcuts

It will make available the familiar shortcuts Ctrl/⌘⇧M to insert %>% and Alt- to insert <-. 