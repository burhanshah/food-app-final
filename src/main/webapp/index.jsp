<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<title>IUnTummy</title>
		<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>Home</title>
	    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
	    <link rel="stylesheet" href="resources/style.css">
	
	</head>
	<body>
		<header>
        	<nav id="navbar">
	            <div id="left">
	                <img src="images/logo.png" alt="Logo">
	                <span id="logo_des"><strong>IUnTummy</strong></span>
	            </div>
	
	            <div id="mid">
	                <ul>
	                    <li><a href="home">Home</a></li>
	                    <li><a href="#sec1">Restaurants</a></li>
	                    <li><a href="#categories">Hot Deals</a></li>
	                    <li><a href="#client">Contact Us</a></li>
	                    </ul>
	                </div>
	
	                <div id="right">
                        <li><a href="userlogin">Login <i class="fas fa-user-tie"></i></a></li>
                        <!-- <li><a href="userlogin">User Login <i class="fas fa-user"></i></a></li> -->
	                </div>
        	</nav>
    	</header>
    	
    	<div class="tagLine">
    <h1>Hungry?!</h1>
</div>

<div class="para1">
    Good, we are Here
</div>

<div class="para2">
    to Serve you :)
</div>
    </section>
    

<section id="order">
    <div id="sec1">
        <h1>The Restaurants You Love</h1>
    </div>


    <div id="sec2" class="restaurant">
       
        <div class="rest_link">
            <a href="restraunt?name=Sajjad"><img src="images/slider/sajjad.jpeg" alt=""></a>
        </div>

        <div class="rest_link">
            <a href="restraunt?name=habib"><img src="images/slider/ah.png" alt=""></a>
        </div>

        <div class="rest_link">
            <a href="restraunt?name=Kolachi"><img src="images/slider/kolachi.jpg" alt=""></a>
        </div>

        <div class="rest_link">
            <a href="#"><img src="images/slider/darbar.jpeg" alt=""></a>
        </div>

        <div class="rest_link">
            <a href="#"><img src="images/slider/adda.jpeg" alt=""></a>
        </div>


        


        <div id="sec2" class="restaurant">
       
            <div class="rest_link">
                <a href=""><img src="images/slider/mc.png" alt=""></a>
            </div>
    
            <div class="rest_link">
                <a href=""><img src="images/slider/mazedar.jpeg" alt=""></a>
            </div>
    
            <div class="rest_link">
                <a href=""><img src="images/slider/pizzahut.jpeg" alt=""></a>
            </div>
    
            <div class="rest_link">
                <a href=""><img src="images/slider/karachifoods.png" alt=""></a>
            </div>
    
            <div class="rest_link">
                <a href=""><img src="images/slider/kfc.jpeg" alt=""></a>
            </div>
        
    </div>

</section>




<section id="categories">
    <h1>
        Food You Love
    </h1>

    <div id="cat_pannel">
      
        <a href="#">
        <div class="catg_1 ctg">
            <span id="price">Rs.275</span>
        </div>
        </a>
        



        
            <a href="#">
            <div class="catg_2 ctg">
                <span id="price">Rs.699</span>
            </div>
            </a>
            


            
                <a href="#">
                <div class="catg_3 ctg">
                    <span id="price">Rs.599</span>
                </div>
                </a>

                <a href="#">
                    <div class="catg_4 ctg">
                        <span id="price">Rs.999</span>
                    </div>
                    </a>
                    
            
            
            
                    
                        <a href="#">
                        <div class="catg_5 ctg">
                            <span id="price">Rs.799</span>
                        </div>
                        </a>
    </div>




    <div id="cat_pannel">
      
        <a href="#">
        <div class="catg_6 ctg">
            <span id="price">Rs.325</span>
        </div>
        </a>
        



        
            <a href="#">
            <div class="catg_7 ctg">
                <span id="price">Rs.280</span>
            </div>
            </a>
            


            
                <a href="#">
                <div class="catg_8 ctg">
                    <span id="price">Rs.220</span>
                </div>
                </a>

                <a href="#">
                    <div class="catg_9 ctg">
                        <span id="price">Rs.399</span>
                    </div>
                    </a>
                    
            
            
            
                    
                        <a href="#">
                        <div class="catg_10 ctg">
                            <span id="price">Rs.699</span>
                        </div>
                        </a>
    </div>




    <div id="cat_pannel">
      
        <a href="#">
        <div class="catg_11 ctg">
            <span id="price">Rs.320</span>
        </div>
        </a>
        



        
            <a href="#">
            <div class="catg_12 ctg">
                <span id="price">Rs.365</span>
            </div>
            </a>
            


            
                <a href="#">
                <div class="catg_13 ctg">
                    <span id="price">Rs.299</span>
                </div>
                </a>

                <a href="#">
                    <div class="catg_14 ctg">
                        <span id="price">Rs.799</span>
                    </div>
                    </a>
                    
            
            
            
                    
                        <a href="#">
                        <div class="catg_15 ctg">
                            <span id="price">Rs.799</span>
                        </div>
                        </a>
    </div>








   



</section>





<section id="client">
    <h1>
        Feel Free To Contact Us :)
    </h1>
    
    
    
    
    
        <form id="forms"action="backend.java">
    
            
        <div id="field">
            <div>Name:</div>
            <div><input type="text" id="name"></div>
        </div>

        <div id="field">
            <div>Contact:</div>
            <div><input type="text" id="name"></div>
        </div>
        
        <div id="field">
            <div>Email:</div>
            <div><input type="text" id="name"></div>
        </div>
    
        <div id="field">
            <div>Message:</div>
        </div>
            <textarea name="" id="" cols="29" rows="3" placeholder="Type Your Message here.." ></textarea>
        
    
            <div class="btn">
                <input type="submit" value="Submit">
                <input type="reset" value="Reset All">
            </div>
    
       
    </form>
    
    
    
    
        </section>
    	
	</body>
</html>