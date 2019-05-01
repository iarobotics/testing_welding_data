import pandas as pd
from sklearn.metrics import confusion_matrix

headers = ['arc']

y_pred = pd.read_csv('y_pred.txt', names=headers)
y = pd.read_csv('y.txt', names=headers)

y_pred = y_pred.arc
y = y.arc

print(confusion_matrix(y, y_pred))
