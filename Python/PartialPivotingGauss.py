import numpy as np

def PartialPivotingGauss (A: list[list], b: list) -> np.ndarray:
    A = np.array(A)
    b = np.array(b)

    if len(A) != len(A[0]):
        print('Not square matrix')
        return
    elif np.linalg.det(A) == 0:
        print('det(A) = 0')
        return
    elif len(A) != len(b):
        print('Matrix and vector with different sizes')
        return

    # Augmented matrix
    augA = np.zeros((len(A), len(A)+1))
    for i in range(len(augA)):
        for j in range(len(A[i])):
            augA[i][j] = A[i][j]
        augA[i][len(augA[0])-1] = b[i]

    # Matrixes by stages, rows and cols
    Stages = np.zeros((len(augA), len(augA), len(augA[0])))
    Stages[0] = augA
    
    for stage in range(1, len(Stages)):     # Each stage
        index = stage - 1
        M = Stages[index].copy()

        max = 0
        maxindex = index
        for k in range(index, len(M)):
            if abs(M[k][index]) > abs(max):
                max = M[k][index]
                maxindex = k

        aux = M[index].copy()
        M[index] = M[maxindex]
        M[maxindex] = aux

        pivot = M[index][index]

        for i in range(stage, len(M)):
            multiplier = (-1)*M[i][index]/pivot

            for j in range(index, len(M[0])):
                M[i][j] = multiplier*M[index][j] + M[i][j]
        
        Stages[stage] = M
    print(Stages)
    return Stages[-1]

def BackwardSubstitution(A: np.ndarray) -> np.ndarray:
    # Ax = b
    n = len(A)
    x, b = np.zeros(n), np.zeros(n)
    
    # b vector
    for i in range(n):
        b[i] = A[i][-1]

    # Last term
    x[-1] = A[-2][-1]/A[-1][-1]
    
    for i in range(n-1, 0, -1):
        S = b[i]
        for j in range (i+1, n):
            S = S - A[i][j]*x[j]
        x[i] = S/A[i][i]

    print(x)

A = PartialPivotingGauss([[-1,7,7,4],[1.1,-7.6999,-1,1],[5,-3,0,6],[-12,1,9,0]], [1,1,1,1])
BackwardSubstitution(A)
