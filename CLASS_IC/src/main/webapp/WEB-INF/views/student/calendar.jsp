<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
     <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
 <div class="wrapper">
  
        <div class="main-panel">
         
            <div class="content">
                <div class="container-fluid">
                    <div class="header text-center">
                        <h3 class="title">FullCalendar.io</h3>
                        <p class="category">Handcrafted by our friends from
                            <a target="_blank" href="https://fullcalendar.io/">FullCalendar.io</a>. Please checkout their
                            <a href="https://fullcalendar.io/docs/" target="_blank">full documentation.</a>
                        </p>
                        
                    </div>
             
                    <div class="row">
                    
                        <div class="col-md-10 col-md-offset-1">
                      
                
                            <div class="card card-calendar">
                                <div class="card-content" class="ps-child">
                                    <div id="fullCalendar"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    </div>
    </div>
    </div>
    
    <script type="text/javascript">
    $(document).ready(function() {
        demo.initFullCalendar();
    });
</script>