# H0:  the sequence was produced in a random manner
# Ha:  the sequence was not produced in a random manner  

# Read test data

import numpy as np
import pandas as pd
import scipy.stats as st

# Assuming number of runs greater than 10
def runs_test(d, v, alpha = 0.05):
    # Get positive and negative values
    mask = d > v
    # get runs mask
    p = mask == True
    n = mask == False
    xor = np.logical_xor(p[:-1], p[1:]) 
    # A run can be identified by positive 
    # to negative (or vice versa) changes
    d = sum(xor) + 1 # Get number of runs

    n_p = sum(p) # Number of positives
    n_n = sum(n)
    # Temporary intermediate values
    tmp = 2 * n_p * n_n 
    tmps = n_p + n_n
    # Expected value
    r_hat = np.float64(tmp) / tmps + 1
    # Variance
    s_r_squared = (tmp*(tmp - tmps)) / (tmps*tmps*(tmps-1))
    # Standard deviation
    s_r =  np.sqrt(s_r_squared)
    # Test score
    z = (d - r_hat) / s_r

    # Get normal table 
    z_alpha = st.norm.ppf(1-alpha)
    # Check hypothesis
    return z, z_alpha

filename = "output.txt"

# Load array
d = np.array(np.loadtxt(filename))

(z, p) = runs_test(d, np.median(d))

pd_series = pd.Series(d)
counts = pd_series.value_counts()
e = st.entropy(counts)

print('Wald-Wolfowitz Runs Test')
if p < 0.05 : print('failed')
else : print('passed')
print('z-test statistic: %0.8s' %(z))
print('p-value: %0.8s ' %(p))
print('entropy: %0.8s' %(e))