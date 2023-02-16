CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
cp TestListExamples.java ./student-submission/

cd student-submission
if [[ -f ListExamples.java ]]
then 
    echo "ListExamples Found"
else
    echo "Need ListExamples.java"
    exit 1
fi

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" ListExamples.java
if [[ $? -eq 0 ]]
then
    echo "Java file compiled successfully"
else
  echo "Error: Java file did not compile"
  exit 1
fi

# java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples

# $(java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples)
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > temp.txt

count=$(grep "Failures: 1" temp.txt | wc -l)
#count=$(grep -c "Failures" $output)+0
 # echo out the count
    echo $count




# if [[ "$output" == "Failure" ]]
# if [[ grep -c "Failure" testerResults.txt -ge 1 ]]
echo $output
if [[ $count -gt 0 ]]
then 
    if [[ $count -ne 1 ]]
    then
        echo "The test failed! Get better! There are $count errors in your code! >;("
    else
        echo "The test failed! Get better! There is $count error in your code! >;("

    fi
else 
    echo "The test passed successfully!"
fi