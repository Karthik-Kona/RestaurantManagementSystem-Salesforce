public with sharing class OrderTableStatusHandler {

    public static void updateTableStatus(List<Order__c> newOrders) {

        Set<Id> tableIds = new Set<Id>();

        for (Order__c ord : newOrders) {
            if (ord.Table__c != null) {
                tableIds.add(ord.Table__c);
            }
        }

        if (tableIds.isEmpty()) return;

        Map<Id, Restaurant_Table__c> tableMap = new Map<Id, Restaurant_Table__c>(
            [SELECT Id, Status__c   // 👈 change if your API name is different
             FROM Restaurant_Table__c
             WHERE Id IN :tableIds]
        );

        List<Restaurant_Table__c> tablesToUpdate = new List<Restaurant_Table__c>();

        for (Order__c ord : newOrders) {

            if (ord.Table__c == null || !tableMap.containsKey(ord.Table__c)) continue;

            Restaurant_Table__c tbl = tableMap.get(ord.Table__c);

            if (ord.Order_Status__c == 'New' || 
                ord.Order_Status__c == 'Preparing' || 
                ord.Order_Status__c == 'Served') {

                tbl.Status__c = 'Occupied';
                tablesToUpdate.add(tbl);

            } else if (ord.Order_Status__c == 'Paid' || 
                       ord.Order_Status__c == 'Cancelled') {

                tbl.Status__c = 'Available';
                tablesToUpdate.add(tbl);
            }
        }

        if (!tablesToUpdate.isEmpty()) {
            update tablesToUpdate;
        }
    }
}