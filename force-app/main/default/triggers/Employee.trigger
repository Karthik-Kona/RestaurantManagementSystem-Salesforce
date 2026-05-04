trigger Employee on Employee__c (before insert , before update) {
Map<String, String> stateCodeMap = new Map<String, String>();
for (StateMapping__c mapping : StateMapping__c.getAll().values()) {
        if (mapping.State__c != null && mapping.State_Code__c != null) {
            stateCodeMap.put(mapping.State__c.toLowerCase(), mapping.State_Code__c);
         
            for (Employee__c emp : Trigger.new) {
            if (emp.Employee_State__c != null && 
            (emp.Employee_State_Code__c == null || emp.Employee_State_Code__c.trim() == '')) {
            
            String inputState = emp.Employee_State__c.toLowerCase();

            if (stateCodeMap.containsKey(inputState)) {
                emp.Employee_State_Code__c = stateCodeMap.get(inputState);
        }
    }
} 
}
}
}