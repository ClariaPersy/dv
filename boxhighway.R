
# Step 1: Split the data by cylinder variable 
cylinder_groups <- split(mtcars$mpg, mtcars$cyl) 

# Step 2: Create a boxplot of highway mileage for each cylinder group 
boxplot(cylinder_groups,  
        main = "Highway Mileage by Cylinder",  
        xlab = "Number of Cylinders",  
        ylab = "Highway Mileage", 
        names = c("4 Cylinders", "6 Cylinders", "8 Cylinders"), 
        col = "skyblue", 
        border = "black") 