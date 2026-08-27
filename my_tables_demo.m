% my_tables_simple.m
clear all; clc;

disp('╔════════════════════════════════════════════╗');
disp('║     SIMPLE TABLE DEMO (Octave)            ║');
disp('╚════════════════════════════════════════════╝');
disp('');

% Create data as matrix/array
disp('1. CREATE DATA:');
disp('─────────────────────────────────────────────');

% Using cell array
Names = {'Alice'; 'Bob'; 'Charlie'; 'David'; 'Eve'};
Ages = [25; 30; 35; 28; 32];
Salaries = [50000; 60000; 70000; 55000; 65000];
Depts = {'HR'; 'IT'; 'Finance'; 'IT'; 'HR'};

% Display as table
fprintf('%-10s %-5s %-10s %-10s\n', 'Name', 'Age', 'Salary', 'Department');
fprintf('─────────────────────────────────────────────────────\n');
for i = 1:length(Names)
    fprintf('%-10s %-5d %-10d %-10s\n', Names{i}, Ages(i), Salaries(i), Depts{i});
end
disp('');

% 2. Basic operations
disp('2. STATISTICS:');
disp('─────────────────────────────────────────────');
fprintf('Average Age: %.2f\n', mean(Ages));
fprintf('Average Salary: %.2f\n', mean(Salaries));
fprintf('Min Salary: %d\n', min(Salaries));
fprintf('Max Salary: %d\n', max(Salaries));
fprintf('Total Employees: %d\n', length(Names));
disp('');

% 3. Filter (Age > 30)
disp('3. FILTER (Age > 30):');
disp('─────────────────────────────────────────────');
fprintf('%-10s %-5s %-10s %-10s\n', 'Name', 'Age', 'Salary', 'Department');
fprintf('─────────────────────────────────────────────────────\n');
for i = 1:length(Names)
    if Ages(i) > 30
        fprintf('%-10s %-5d %-10d %-10s\n', Names{i}, Ages(i), Salaries(i), Depts{i});
    end
end
disp('');

% 4. Sort by age
disp('4. SORT BY AGE (Ascending):');
disp('─────────────────────────────────────────────');
[~, idx] = sort(Ages);
fprintf('%-10s %-5s %-10s %-10s\n', 'Name', 'Age', 'Salary', 'Department');
fprintf('─────────────────────────────────────────────────────\n');
for i = idx'
    fprintf('%-10s %-5d %-10d %-10s\n', Names{i}, Ages(i), Salaries(i), Depts{i});
end
disp('');

% 5. Department summary
disp('5. DEPARTMENT SUMMARY:');
disp('─────────────────────────────────────────────');
depts = unique(Depts);
for d = 1:length(depts)
    dept = depts{d};
    idx = strcmp(Depts, dept);
    count = sum(idx);
    avg_sal = mean(Salaries(idx));
    avg_age = mean(Ages(idx));
    fprintf('%-10s Employees: %d, Avg Age: %.1f, Avg Salary: %.2f\n', ...
        dept, count, avg_age, avg_sal);
end
disp('');

disp('╔════════════════════════════════════════════╗');
disp('║     PROGRAM RUN SUCCESSFULLY              ║');
disp('╚════════════════════════════════════════════╝');