import numpy as np

def TotalPivotingGauss (A: list[list], b: list) -> np.ndarray:
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
        maxrow, maxcol = index, index

        for i in range(index, len(M)):
            for j in range(index, len(M)):
                if abs(M[i][j]) > abs(max):
                    max = M[i][j]
                    maxrow, maxcol= i, j

        for i in range(0, len(M)):
            aux = M[i][maxcol]
            M[i][maxcol] = M[i][index]
            M[i][index] = aux
        
        aux = M[index].copy()
        M[index] = M[maxrow]
        M[maxrow] = aux

        pivot = M[index][index]

        for i in range(stage, len(M)):
            multiplier = (-1)*M[i][index]/pivot

            for j in range(index, len(M[0])):
                M[i][j] = multiplier*M[index][j] + M[i][j]
        
        Stages[stage] = M
    print(Stages)

TotalPivotingGauss([[14,6,78,3],[3,15,2,-5],[-7,4,-23,2],[1,-3,-2,16]], [12,32,-24,14])
