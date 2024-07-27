public class Dog {
    private string name;
    private integer age;
    public void setName(String name){
        this.name=name;  // this is pointing to instance variable     
    }
    public string getName(){
            return this.name;
        }
    public void setAge(Integer age){
      
        if(age<5){
            system.debug('you cant put below 5');
        }
        else{
             this.age =age;
        }
       
    }
    public Integer getAge(){
        return this.age;
    }
}