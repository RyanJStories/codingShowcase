using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoFinalexam
{
    class StudentS
    {


        List<Student> theStudentList;



        public string PopulateStudents(string path)
        {
            //this is the method you need to implement...NO CONSOLE LOGIC in this file.
            //use the parameter path for file name, and return an error string!!

            //1) create instance of theStudentList (theStudentList = new List<Student>();)
            //2) create an instance of the StreamReader Class to read the data from the file named in the variable path
            //3) Open the File and read line by line using theReadLIne command
            //4) split the line
            //5) create one instance of Student, fill in id, first and last through the constructor
            //6) now loop through remaining fields 3 - 23 for earned and possible and set though method EnterGrade.
            //7) call CalGrade on the Student object - that sets the average and grade.
            //8) Add that Student to theStudentList (theStudentList.Add(aStudent);)
            //9) read next line and loop until null or line = ""
            //10) Close the file

            //do not forgot to use a Try/Catch block.


        }

        public int ListLength
        {
            get { return theStudentList.Count; }
        }

        public string StudentID(int index)
        {
            return theStudentList.ElementAt(index).ID;
        }

        public string StudentLastName(int index)
        {
            return theStudentList.ElementAt(index).NameLast;
        }

        public string StudentGrade(int index)
        {

            return theStudentList.ElementAt(index).LetterGrade;
        }

        public float StudentAverage(int index)
        {

            return theStudentList.ElementAt(index).Average;
        }

    }

}

}
