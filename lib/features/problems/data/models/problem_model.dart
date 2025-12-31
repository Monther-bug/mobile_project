class Problem {
  final String id;
  final String title;
  final String difficulty;
  final String description;
  final List<ProblemExample> examples;
  final List<String> constraints;
  final String category;

  Problem({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.description,
    required this.examples,
    required this.constraints,
    required this.category,
  });

  // Factory for mock data
  factory Problem.mock() {
    return mockList[0];
  }

  static List<Problem> get mockList {
    return [
      Problem(
        id: '1',
        title: 'Two Sum',
        difficulty: 'Easy',
        category: 'Arrays',
        description:
            'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.\n\nYou may assume that each input would have exactly one solution, and you may not use the same element twice.\n\nYou can return the answer in any order.',
        examples: [
          ProblemExample(
            input: 'nums = [2,7,11,15], target = 9',
            output: '[0,1]',
            explanation: 'Because nums[0] + nums[1] == 9, we return [0, 1].',
          ),
          ProblemExample(input: 'nums = [3,2,4], target = 6', output: '[1,2]'),
        ],
        constraints: [
          '2 <= nums.length <= 10^4',
          '-10^9 <= nums[i] <= 10^9',
          '-10^9 <= target <= 10^9',
          'Only one valid answer exists.',
        ],
      ),
      Problem(
        id: '2',
        title: 'Longest Palindromic Substring',
        difficulty: 'Medium',
        category: 'String',
        description:
            'Given a string s, return the longest palindromic substring in s.',
        examples: [
          ProblemExample(
            input: 's = "babad"',
            output: '"bab"',
            explanation: '"aba" is also a valid answer.',
          ),
          ProblemExample(input: 's = "cbbd"', output: '"bb"'),
        ],
        constraints: [
          '1 <= s.length <= 1000',
          's consist of only digits and English letters.',
        ],
      ),
      Problem(
        id: '3',
        title: 'Median of Two Sorted Arrays',
        difficulty: 'Hard',
        category: 'Arrays',
        description:
            'Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.\n\nThe overall run time complexity should be O(log (m+n)).',
        examples: [
          ProblemExample(
            input: 'nums1 = [1,3], nums2 = [2]',
            output: '2.00000',
            explanation: 'merged array = [1,2,3] and median is 2.',
          ),
          ProblemExample(
            input: 'nums1 = [1,2], nums2 = [3,4]',
            output: '2.50000',
            explanation:
                'merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.',
          ),
        ],
        constraints: [
          'nums1.length == m',
          'nums2.length == n',
          '0 <= m <= 1000',
          '0 <= n <= 1000',
          '1 <= m + n <= 2000',
          '-10^6 <= nums1[i], nums2[i] <= 10^6',
        ],
      ),
      Problem(
        id: '4',
        title: 'Valid Parentheses',
        difficulty: 'Easy',
        category: 'Stack',
        description:
            'Given a string s containing just the characters "(", ")", "{", "}", "[" and "]", determine if the input string is valid.\n\nAn input string is valid if:\n1. Open brackets must be closed by the same type of brackets.\n2. Open brackets must be closed in the correct order.\n3. Every close bracket has a corresponding open bracket of the same type.',
        examples: [
          ProblemExample(input: 's = "()"', output: 'true'),
          ProblemExample(input: 's = "()[]{}"', output: 'true'),
          ProblemExample(input: 's = "(]"', output: 'false'),
        ],
        constraints: [
          '1 <= s.length <= 10^4',
          's consists of parentheses only "()[]{}"',
        ],
      ),
      Problem(
        id: '5',
        title: 'Merge Two Sorted Lists',
        difficulty: 'Easy',
        category: 'Linked List',
        description:
            'You are given the heads of two sorted linked lists list1 and list2.\n\nMerge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.\n\nReturn the head of the merged linked list.',
        examples: [
          ProblemExample(
            input: 'list1 = [1,2,4], list2 = [1,3,4]',
            output: '[1,1,2,3,4,4]',
          ),
          ProblemExample(input: 'list1 = [], list2 = []', output: '[]'),
          ProblemExample(input: 'list1 = [], list2 = [0]', output: '[0]'),
        ],
        constraints: [
          'The number of nodes in both lists is in the range [0, 50].',
          '-100 <= Node.val <= 100',
          'Both list1 and list2 are sorted in non-decreasing order.',
        ],
      ),
      Problem(
        id: '6',
        title: 'Maximum Subarray',
        difficulty: 'Medium',
        category: 'Arrays',
        description:
            'Given an integer array nums, find the subarray with the largest sum, and return its sum.',
        examples: [
          ProblemExample(
            input: 'nums = [-2,1,-3,4,-1,2,1,-5,4]',
            output: '6',
            explanation: 'The subarray [4,-1,2,1] has the largest sum 6.',
          ),
          ProblemExample(input: 'nums = [1]', output: '1'),
          ProblemExample(input: 'nums = [5,4,-1,7,8]', output: '23'),
        ],
        constraints: ['1 <= nums.length <= 10^5', '-10^4 <= nums[i] <= 10^4'],
      ),
      Problem(
        id: '7',
        title: 'Climbing Stairs',
        difficulty: 'Easy',
        category: 'Dynamic Programming',
        description:
            'You are climbing a staircase. It takes n steps to reach the top.\n\nEach time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?',
        examples: [
          ProblemExample(
            input: 'n = 2',
            output: '2',
            explanation: '1. 1 step + 1 step\n2. 2 steps',
          ),
          ProblemExample(
            input: 'n = 3',
            output: '3',
            explanation: '1. 1+1+1\n2. 1+2\n3. 2+1',
          ),
        ],
        constraints: ['1 <= n <= 45'],
      ),
      Problem(
        id: '8',
        title: 'Binary Tree Inorder Traversal',
        difficulty: 'Easy',
        category: 'Trees',
        description:
            'Given the root of a binary tree, return the inorder traversal of its nodes\' values.',
        examples: [
          ProblemExample(input: 'root = [1,null,2,3]', output: '[1,3,2]'),
          ProblemExample(input: 'root = []', output: '[]'),
          ProblemExample(input: 'root = [1]', output: '[1]'),
        ],
        constraints: [
          'The number of nodes in the tree is in the range [0, 100].',
          '-100 <= Node.val <= 100',
        ],
      ),
    ];
  }
}

class ProblemExample {
  final String input;
  final String output;
  final String? explanation;

  ProblemExample({required this.input, required this.output, this.explanation});
}
