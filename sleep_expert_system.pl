% Sleep Optimization Expert System

% Rules for sleep advice
sleep_advice(night_shift) :-
    write('Maintain consistent sleep hours, even on non-working days.'), nl,
    write('Wear blue light-blocking glasses before bed.'), nl.

sleep_advice(rotating_shifts) :-
    write('Gradually shift your sleep schedule when transitioning shifts.'), nl,
    write('Take short naps before night shifts for better alertness.'), nl.

sleep_quality(Score) :-
    Score < 6,
    write('Consider relaxation techniques like meditation before sleep.'), nl,
    write('Limit caffeine intake 4-6 hours before bedtime.'), nl.

light_exposure(no) :-
    write('Use a light therapy box during waking hours.'), nl,
    write('Spend time outdoors when possible.'), nl.

exercise_advice(never) :-
    write('Incorporate light exercise into your routine, like walking.'), nl.

exercise_advice(daily) :-
    write('Ensure exercise is done at least 2-3 hours before bedtime.'), nl.

sleep_environment(no) :-
    write('Use blackout curtains or an eye mask.'), nl,
    write('Consider a white noise machine to block out sound.'), nl.

% Main function to interact with the user
start :-
    write('Welcome to the Sleep Optimization Expert System!'), nl,

    % Collect user inputs
    write('Enter your work schedule (e.g., night_shift, rotating_shifts): '),
    read(WorkSchedule),
    sleep_advice(WorkSchedule), nl,

    write('Rate your sleep quality on a scale of 1 to 10: '),
    read(SleepQuality),
    (SleepQuality < 6 -> sleep_quality(SleepQuality) ; true), nl,

    write('Do you get sunlight exposure? (yes/no): '),
    read(LightExposure),
    (LightExposure = no -> light_exposure(no) ; true), nl,

    write('How often do you exercise weekly? (e.g., never, daily): '),
    read(ExerciseFrequency),s
    exercise_advice(ExerciseFrequency), nl,

    write('Is your sleep environment quiet and dark? (yes/no): '),
    read(SleepEnvironment),
    (SleepEnvironment = no -> sleep_environment(no) ; true), nl,

    write('Thank you for using the Sleep Optimization Expert System!'), nl.
