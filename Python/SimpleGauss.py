import numpy as np

def SimpleGauss (A: list[list], b: list) -> np.ndarray:
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

        pivot = M[index][index]

        for i in range(stage, len(M)):
            multiplier = (-1)*M[i][index]/pivot

            for j in range(index, len(M[0])):
                M[i][j] = multiplier*M[index][j] + M[i][j]
        
        Stages[stage] = M
    print(Stages)
    return Stages[-1]


A = SimpleGauss([[-1,7,7,4],[1.1,-7.6999,-1,1],[5,-3,0,6],[-12,1,9,0]], [1,1,1,1])
