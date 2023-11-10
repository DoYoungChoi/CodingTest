func solution(_ answers:[Int]) -> [Int] {
    let answer1 = [1, 2, 3, 4, 5]
    let answer2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let answer3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    var correct1 = 0
    var correct2 = 0
    var correct3 = 0

    for (index, answer) in answers.enumerated() {
        correct1 += answer == answer1[index % 5] ? 1 : 0
        correct2 += answer == answer2[index % 8] ? 1 : 0
        correct3 += answer == answer3[index % 10] ? 1 : 0
    }

    var result: [Int] = []
    if correct1 > correct2 {
        result = [1]

        if correct1 > correct3 {
            return result
        } else if correct1 == correct3 {
            result.append(3)
            return result
        } else {
            return [3]
        }
    } else if correct1 == correct2 {
        result = [1, 2]

        if correct1 > correct3 {
            return result
        } else if correct1 == correct3 {
            result.append(3)
            return result
        } else {
            return [3]
        }
    } else {
        result = [2]

        if correct2 > correct3 {
            return result
        } else if correct2 == correct3 {
            result.append(3)
            return result
        } else {
            return [3]
        }
    }
}
