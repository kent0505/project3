class Quiz {
  final int level;
  final String question;
  final Answer answer1;
  final Answer answer2;
  final Answer answer3;
  final Answer answer4;

  Quiz({
    required this.level,
    required this.question,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
  });
}

class Answer {
  final String title;
  final bool correct;

  Answer({
    required this.title,
    required this.correct,
  });
}

List<Quiz> quizes = [
  Quiz(
    level: 1,
    question: 'Which gas is the main component of Earth\'s atmosphere?',
    answer1: Answer(title: 'Oxygen', correct: false),
    answer2: Answer(title: 'Nitrogen', correct: true),
    answer3: Answer(title: 'Hydrogen', correct: false),
    answer4: Answer(title: 'Carbon Dioxide', correct: false),
  ),
  Quiz(
    level: 1,
    question: 'What is the capital of France?',
    answer1: Answer(title: 'Rome', correct: false),
    answer2: Answer(title: 'Berlin', correct: false),
    answer3: Answer(title: 'Paris', correct: true),
    answer4: Answer(title: 'Madrid', correct: false),
  ),
  Quiz(
    level: 1,
    question: 'Who wrote the novel "War and Peace"?',
    answer1: Answer(title: 'Fyodor Dostoevsky', correct: false),
    answer2: Answer(title: 'Leo Tolstoy', correct: true),
    answer3: Answer(title: 'Ivan Turgenev', correct: false),
    answer4: Answer(title: 'Alexander Pushkin', correct: false),
  ),
  Quiz(
    level: 1,
    question: 'What is the primary source of energy for Earth?',
    answer1: Answer(title: 'Wind', correct: false),
    answer2: Answer(title: 'The Sun', correct: true),
    answer3: Answer(title: 'Geothermal', correct: false),
    answer4: Answer(title: 'Hydropower', correct: false),
  ),
  Quiz(
    level: 1,
    question: 'Which ocean is the largest?',
    answer1: Answer(title: 'Atlantic Ocean', correct: false),
    answer2: Answer(title: 'Indian Ocean', correct: false),
    answer3: Answer(title: 'Arctic Ocean', correct: false),
    answer4: Answer(title: 'Pacific Ocean', correct: true),
  ),
  Quiz(
    level: 1,
    question: 'How many continents are there on Earth?',
    answer1: Answer(title: '5', correct: false),
    answer2: Answer(title: '6', correct: false),
    answer3: Answer(title: '7', correct: true),
    answer4: Answer(title: '8', correct: false),
  ),
  Quiz(
    level: 1,
    question: 'What color are bananas when they are ripe?',
    answer1: Answer(title: 'Red', correct: false),
    answer2: Answer(title: 'Yellow', correct: true),
    answer3: Answer(title: 'Green', correct: false),
    answer4: Answer(title: 'Blue', correct: false),
  ),
  Quiz(
    level: 1,
    question: 'Which animal is known as "man\'s best friend"?',
    answer1: Answer(title: 'Cat', correct: false),
    answer2: Answer(title: 'Dog', correct: true),
    answer3: Answer(title: 'Horse', correct: false),
    answer4: Answer(title: 'Rabbit', correct: false),
  ),

  // 2
  Quiz(
    level: 2,
    question: 'Which planet is known as the Red Planet?',
    answer1: Answer(title: 'Venus', correct: false),
    answer2: Answer(title: 'Mars', correct: true),
    answer3: Answer(title: 'Jupiter', correct: false),
    answer4: Answer(title: 'Saturn', correct: false),
  ),
  Quiz(
    level: 2,
    question: 'What is the chemical symbol for water?',
    answer1: Answer(title: 'CO2', correct: false),
    answer2: Answer(title: 'H2O', correct: true),
    answer3: Answer(title: 'O2', correct: false),
    answer4: Answer(title: 'N2', correct: false),
  ),
  Quiz(
    level: 2,
    question: 'In which year did the Titanic sink?',
    answer1: Answer(title: '1912', correct: true),
    answer2: Answer(title: '1905', correct: false),
    answer3: Answer(title: '1898', correct: false),
    answer4: Answer(title: '1923', correct: false),
  ),
  Quiz(
    level: 2,
    question: 'What is the process by which plants make their food?',
    answer1: Answer(title: 'Respiration', correct: false),
    answer2: Answer(title: 'Photosynthesis', correct: true),
    answer3: Answer(title: 'Digestion', correct: false),
    answer4: Answer(title: 'Fermentation', correct: false),
  ),
  Quiz(
    level: 2,
    question: 'What is the freezing point of water?',
    answer1: Answer(title: '0 degrees Celsius', correct: true),
    answer2: Answer(title: '32 degrees Celsius', correct: false),
    answer3: Answer(title: '50 degrees Celsius', correct: false),
    answer4: Answer(title: '100 degrees Celsius', correct: false),
  ),
  Quiz(
    level: 2,
    question: 'Who was the first president of the United States?',
    answer1: Answer(title: 'Thomas Jefferson', correct: false),
    answer2: Answer(title: 'Abraham Lincoln', correct: false),
    answer3: Answer(title: 'John Adams', correct: false),
    answer4: Answer(title: 'George Washington', correct: true),
  ),
  Quiz(
    level: 2,
    question: 'What is the largest planet in our solar system?',
    answer1: Answer(title: 'Earth', correct: false),
    answer2: Answer(title: 'Mars', correct: false),
    answer3: Answer(title: 'Jupiter', correct: true),
    answer4: Answer(title: 'Saturn', correct: false),
  ),
  Quiz(
    level: 2,
    question: 'What is the main language spoken in Brazil?',
    answer1: Answer(title: 'Spanish', correct: false),
    answer2: Answer(title: 'Portuguese', correct: true),
    answer3: Answer(title: 'English', correct: false),
    answer4: Answer(title: 'French', correct: false),
  ),

  // 3
  Quiz(
    level: 3,
    question: 'Who painted the Mona Lisa?',
    answer1: Answer(title: 'Vincent van Gogh', correct: false),
    answer2: Answer(title: 'Pablo Picasso', correct: false),
    answer3: Answer(title: 'Leonardo da Vinci', correct: true),
    answer4: Answer(title: 'Michelangelo', correct: false),
  ),
  Quiz(
    level: 3,
    question: 'What is the hardest natural substance on Earth?',
    answer1: Answer(title: 'Gold', correct: false),
    answer2: Answer(title: 'Iron', correct: false),
    answer3: Answer(title: 'Diamond', correct: true),
    answer4: Answer(title: 'Silver', correct: false),
  ),
  Quiz(
    level: 3,
    question: 'Which element has the chemical symbol "O"?',
    answer1: Answer(title: 'Gold', correct: false),
    answer2: Answer(title: 'Oxygen', correct: true),
    answer3: Answer(title: 'Osmium', correct: false),
    answer4: Answer(title: 'Helium', correct: false),
  ),
  Quiz(
    level: 3,
    question: 'Who was the first person to walk on the moon?',
    answer1: Answer(title: 'Buzz Aldrin', correct: false),
    answer2: Answer(title: 'Neil Armstrong', correct: true),
    answer3: Answer(title: 'Yuri Gagarin', correct: false),
    answer4: Answer(title: 'Michael Collins', correct: false),
  ),
  Quiz(
    level: 3,
    question: 'Which element has the atomic number 1?',
    answer1: Answer(title: 'Helium', correct: false),
    answer2: Answer(title: 'Hydrogen', correct: true),
    answer3: Answer(title: 'Carbon', correct: false),
    answer4: Answer(title: 'Oxygen', correct: false),
  ),
  Quiz(
    level: 3,
    question: 'Who discovered penicillin?',
    answer1: Answer(title: 'Marie Curie', correct: false),
    answer2: Answer(title: 'Alexander Fleming', correct: true),
    answer3: Answer(title: 'Louis Pasteur', correct: false),
    answer4: Answer(title: 'Gregor Mendel', correct: false),
  ),
  Quiz(
    level: 3,
    question: 'What is the capital of Japan?',
    answer1: Answer(title: 'Seoul', correct: false),
    answer2: Answer(title: 'Beijing', correct: false),
    answer3: Answer(title: 'Tokyo', correct: true),
    answer4: Answer(title: 'Bangkok', correct: false),
  ),
  Quiz(
    level: 3,
    question: 'What is the smallest prime number?',
    answer1: Answer(title: '0', correct: false),
    answer2: Answer(title: '1', correct: false),
    answer3: Answer(title: '2', correct: true),
    answer4: Answer(title: '3', correct: false),
  ),

  // 4
  Quiz(
    level: 4,
    question: 'What is the capital of Australia?',
    answer1: Answer(title: 'Sydney', correct: false),
    answer2: Answer(title: 'Melbourne', correct: false),
    answer3: Answer(title: 'Canberra', correct: true),
    answer4: Answer(title: 'Brisbane', correct: false),
  ),
  Quiz(
    level: 4,
    question: 'Which gas do plants absorb from the atmosphere?',
    answer1: Answer(title: 'Nitrogen', correct: false),
    answer2: Answer(title: 'Oxygen', correct: false),
    answer3: Answer(title: 'Carbon Dioxide', correct: true),
    answer4: Answer(title: 'Hydrogen', correct: false),
  ),
  Quiz(
    level: 4,
    question: 'In what year did World War II end?',
    answer1: Answer(title: '1941', correct: false),
    answer2: Answer(title: '1945', correct: true),
    answer3: Answer(title: '1950', correct: false),
    answer4: Answer(title: '1939', correct: false),
  ),
  Quiz(
    level: 4,
    question: 'Which organ in the human body is responsible for pumping blood?',
    answer1: Answer(title: 'Brain', correct: false),
    answer2: Answer(title: 'Lungs', correct: false),
    answer3: Answer(title: 'Liver', correct: false),
    answer4: Answer(title: 'Heart', correct: true),
  ),
  Quiz(
    level: 4,
    question: 'What is the currency of the United Kingdom?',
    answer1: Answer(title: 'Euro', correct: false),
    answer2: Answer(title: 'Dollar', correct: false),
    answer3: Answer(title: 'Pound Sterling', correct: true),
    answer4: Answer(title: 'Yen', correct: false),
  ),
  Quiz(
    level: 4,
    question: 'Who wrote "Hamlet"?',
    answer1: Answer(title: 'Charles Dickens', correct: false),
    answer2: Answer(title: 'William Shakespeare', correct: true),
    answer3: Answer(title: 'Mark Twain', correct: false),
    answer4: Answer(title: 'Jane Austen', correct: false),
  ),
  Quiz(
    level: 4,
    question: 'What is the longest river in the world?',
    answer1: Answer(title: 'Amazon River', correct: false),
    answer2: Answer(title: 'Nile River', correct: true),
    answer3: Answer(title: 'Mississippi River', correct: false),
    answer4: Answer(title: 'Yangtze River', correct: false),
  ),
  Quiz(
    level: 4,
    question: 'What is the main ingredient in traditional Japanese miso soup?',
    answer1: Answer(title: 'Rice', correct: false),
    answer2: Answer(title: 'Seaweed', correct: false),
    answer3: Answer(title: 'Soybeans', correct: true),
    answer4: Answer(title: 'Fish', correct: false),
  ),

  // 5
  Quiz(
    level: 5,
    question: 'What is the smallest unit of life?',
    answer1: Answer(title: 'Atom', correct: false),
    answer2: Answer(title: 'Molecule', correct: false),
    answer3: Answer(title: 'Cell', correct: true),
    answer4: Answer(title: 'Organ', correct: false),
  ),
  Quiz(
    level: 5,
    question: 'Who developed the theory of relativity?',
    answer1: Answer(title: 'Isaac Newton', correct: false),
    answer2: Answer(title: 'Galileo Galilei', correct: false),
    answer3: Answer(title: 'Albert Einstein', correct: true),
    answer4: Answer(title: 'Stephen Hawking', correct: false),
  ),
  Quiz(
    level: 5,
    question: 'What is the chemical formula for table salt?',
    answer1: Answer(title: 'NaCl', correct: true),
    answer2: Answer(title: 'KCl', correct: false),
    answer3: Answer(title: 'CaCl2', correct: false),
    answer4: Answer(title: 'Na2SO4', correct: false),
  ),
  Quiz(
    level: 5,
    question: 'What is the most abundant gas in the Earth\'s atmosphere?',
    answer1: Answer(title: 'Oxygen', correct: false),
    answer2: Answer(title: 'Carbon Dioxide', correct: false),
    answer3: Answer(title: 'Nitrogen', correct: true),
    answer4: Answer(title: 'Argon', correct: false),
  ),
  Quiz(
    level: 5,
    question:
        'Which physicist is known for his work on black holes and authored "A Brief History of Time"?',
    answer1: Answer(title: 'Albert Einstein', correct: false),
    answer2: Answer(title: 'Richard Feynman', correct: false),
    answer3: Answer(title: 'Stephen Hawking', correct: true),
    answer4: Answer(title: 'Niels Bohr', correct: false),
  ),
  Quiz(
    level: 5,
    question: 'What is the SI unit of electric current?',
    answer1: Answer(title: 'Volt', correct: false),
    answer2: Answer(title: 'Ohm', correct: false),
    answer3: Answer(title: 'Ampere', correct: true),
    answer4: Answer(title: 'Watt', correct: false),
  ),
  Quiz(
    level: 5,
    question: 'Who composed the opera "The Magic Flute"?',
    answer1: Answer(title: 'Ludwig van Beethoven', correct: false),
    answer2: Answer(title: 'Johann Sebastian Bach', correct: false),
    answer3: Answer(title: 'Wolfgang Amadeus Mozart', correct: true),
    answer4: Answer(title: 'Franz Schubert', correct: false),
  ),
  Quiz(
    level: 5,
    question: 'What is the main constituent of natural gas?',
    answer1: Answer(title: 'Ethane', correct: false),
    answer2: Answer(title: 'Propane', correct: false),
    answer3: Answer(title: 'Methane', correct: true),
    answer4: Answer(title: 'Butane', correct: false),
  ),
];
