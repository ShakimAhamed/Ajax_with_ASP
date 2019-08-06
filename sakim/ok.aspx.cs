using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace sakim
{
    public partial class ok : System.Web.UI.Page
    {

       protected void Page_Load(object sender, EventArgs e)
       {

       }

       [System.Web.Services.WebMethod]
       [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]
       public static List<Course> GetData()
       {
        
           List<Course> list = new List<Course>();

           SqlConnection con = new SqlConnection("Data Source=DESKTOP-0657PD4\\SQLEXPRESS;Initial Catalog=test1;Integrated Security=True");
           SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
           cmd.CommandText = "select course_id ,course_name,room from Course";
           cmd.Connection = con;
           con.Open();
           SqlDataReader reader = cmd.ExecuteReader();


          while (reader.Read())
           {
               Course obj = new Course();

               obj.course_id = reader["course_id"].ToString();

               obj.course_name = reader["course_name"].ToString();
               obj.room = reader["room"].ToString();

               list.Add(obj);
           }
           con.Close();

           return list;
          
        }

        public class Course
        {
           public string course_id { get; set; }
           public string course_name { get; set; }
           public string room { get; set; }
        }
        
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)] 
        public static List<Student>  GetData1(string room)
        {
           // return rm;
          
          List<Student> list = new List<Student>();
           
           SqlConnection con = new SqlConnection("Data Source=DESKTOP-0657PD4\\SQLEXPRESS;Initial Catalog=test1;Integrated Security=True");
           SqlCommand cmd1 = new System.Data.SqlClient.SqlCommand();
           cmd1.CommandText = "SELECT p.name, p.student_id from (SELECT course.course_id,course.course_name,course.room ,course_taken.student_id, student.name FROM course inner JOIN course_taken on course.course_id = course_taken.course_id inner join student on student.student_id = course_taken.student_id) as p where p.course_name = '"+room+"'";
           cmd1.Connection = con;

           con.Open();
           SqlDataReader reader1 = cmd1.ExecuteReader();

           while (reader1.Read())
           {
               Student obj1 = new Student();
               
               obj1.student_id = reader1["student_id"].ToString();
               obj1.name = reader1["name"].ToString();

               list.Add(obj1);
           }
           con.Close();

           return list;
           
       }



        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]
        public static List<Student> GetData6(string name1)
        {
            // return rm;

            List<Student> list = new List<Student>();

            SqlConnection con = new SqlConnection("Data Source=DESKTOP-0657PD4\\SQLEXPRESS;Initial Catalog=test1;Integrated Security=True");
            SqlCommand cmd1 = new System.Data.SqlClient.SqlCommand();
            cmd1.CommandText = "SELECT p.name, p.student_id from (SELECT course.course_id,course.course_name,course.room ,course_taken.student_id, student.name FROM course inner JOIN course_taken on course.course_id = course_taken.course_id inner join student on student.student_id = course_taken.student_id) as p where p.course_name = '" + name1 + "'";
            cmd1.Connection = con;

            con.Open();
            SqlDataReader reader1 = cmd1.ExecuteReader();

            while (reader1.Read())
            {
                Student obj1 = new Student();

                obj1.student_id = reader1["student_id"].ToString();
                obj1.name = reader1["name"].ToString();

                list.Add(obj1);
            }
            con.Close();

            return list;

        }

       public class Student
       {
           public string student_id { get; set; }
           public string name { get; set; }
       
       }



 
       [System.Web.Services.WebMethod]
       [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]
       public static List<Course_Taken> GetData2(string name)
       {

          List<Course_Taken> list = new List<Course_Taken>();

           SqlConnection con = new SqlConnection("Data Source=DESKTOP-0657PD4\\SQLEXPRESS;Initial Catalog=test1;Integrated Security=True");
           SqlCommand cmd1 = new System.Data.SqlClient.SqlCommand();
           cmd1.CommandText = "SELECT room,course_name FROM  course WHERE room = '" + name + "'";
           cmd1.Connection = con;

           con.Open();
           SqlDataReader reader1 = cmd1.ExecuteReader();

           while (reader1.Read())
           {
               Course_Taken obj2 = new Course_Taken();

               obj2.room = reader1["room"].ToString();
               obj2.course_name = reader1["course_name"].ToString();

               list.Add(obj2);
           }
           con.Close();

           return list;

       }

       public class Course_Taken
       {
           public string student_id { get; set; }
           public string course_id { get; set; }
           public string course_name { get; set; }
           public string room { get; set; }

       }


      
    }
}