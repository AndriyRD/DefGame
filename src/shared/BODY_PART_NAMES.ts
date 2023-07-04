enum COMMON {
    ROOT = 'HumanoidRootPart',
    HEAD = 'Head',
    RIGHT_HAND = 'RightHand',
    LEFT_HAND = 'LeftHand',
    RIGHT_FOOT = 'RightFoot',
    LEFT_FOOT = 'LeftFoot',
}

enum R6 {
    TORSO = 'TORSO'
}

enum R15 {
    UPPER_TORSO = 'UpperTorso',
    LOWER_TORSO = 'LowerTorso',
    RIGHT_LOWER_ARM = 'RightLowerArm',
    LEFT_LOWER_ARM = 'LeftLowerArm'
}

export = {
    MAIN: COMMON,
    R6: R6,
    R15: R15
}