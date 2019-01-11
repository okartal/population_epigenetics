# coding: utf-8
import pandas as pd
import seaborn as sns
sns.set()
iris = sns.load_dataset('iris')
iris.head()
seeds = pd.read_csv("../data/phenotyping/phenotype_seeds.csv", header=0)
seeds.head()
get_ipython().magic('pinfo seeds.unstack')
get_ipython().magic('pinfo seeds.pivot')
iris
get_ipython().magic('pinfo seeds.pivot')
seeds.pivot(index='plant label', columns='measurement', values='value').head()
seeds.pivot(index='plant label', columns='measurement', values=['value', 'generation']).head()
seeds.head()
get_ipython().magic('pinfo seeds.pivot')
seeds.pivot(index='plant label', columns='measurement', values='value')['generation']
seeds.head()
seeds.pivot(index=['plant label', 'generation'], columns='measurement', values='value')
get_ipython().magic('pinfo seeds.pivot')
get_ipython().magic('pinfo seeds.pivot_table')
seeds.pivot_table(index=['plant label', 'generation'], columns='measurement', values='value').head()
seeds.pivot_table(index='plant label', columns='measurement', values='value').head()
seeds.pivot_table(index=['plant label', 'generation'], columns='measurement', values='value').head()
seeds_piv = seeds.pivot_table(index=['plant label', 'generation'], columns='measurement', values='value')
get_ipython().magic('pinfo seeds_piv.reset_index')
seeds_piv.reset_index()
seeds_piv = seeds.pivot_table(index=['plant label', 'generation'], columns='measurement', values='value').reset_index()
g = sns.lmplot(x="seed count", y="seed weight (mg)", hue="generation", size=5, data=seeds_piv)
import matplotlib.pyplot as plt
plt.show()
plt.show()
g = sns.lmplot(x="seed count", y="seed weight (mg)", hue="generation", size=5, data=seeds_piv)
plt.show()
seeds_piv['avg. weight per seed (mg)'] = seeds_piv['seed weight (mg)'] / seeds_piv['seed count']
sns.stripplot(x='avg. weight per seed (mg)', y='generation', data=seeds_piv, alpha=.25)
plt.show()
sns.stripplot(x='avg. weight per seed (mg)', y='generation', data=seeds_piv, alpha=.5)
plt.show()
seeds_piv['avg. weight per seed (ug)'] = seeds_piv['avg. weight per seed (mg)']*1000
seeds_piv
sns.stripplot(x='avg. weight per seed (ug)', y='generation', data=seeds_piv, alpha=.5)
plt.show()
sns.stripplot(x='avg. weight per seed (ug)', y='generation', data=seeds_piv, alpha=.75)
plt.show()
sns.stripplot(x='avg. weight per seed (ug)', y='generation', data=seeds_piv, alpha=.75, size=5)
plt.show()
sns.stripplot(x='avg. weight per seed (ug)', y='generation', data=seeds_piv, alpha=.6, size=10)
plt.show()
