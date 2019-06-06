<%
    String states[] = {"Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh", "Uttarakhand", "West Bengal","Andaman and Nicobar Islands", "Chandigarh", "Dadra and Nagar Haveli", "Daman and Diu", "Lakshadweep", "Delhi", "Puducherry"};
    String q = request.getParameter("q");
    String p=q.toLowerCase();
    StringBuilder sb = new StringBuilder();
    for(String state : states)
    {
        if(state.toLowerCase().startsWith(p))
        {
            sb.append(state + "<br/>");
        }
    }
    String matchingCities = sb.toString();
    out.println(matchingCities);
%>