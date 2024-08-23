#!/usr/bin/env python
# coding: utf-8

# ## transformation_logistics
# 
# New notebook

# In[1]:


from pyspark.sql.functions import *
from pyspark.sql.types import *

df_freight = spark.read.table("LH_Logistics.dbo_Freight")
display(df_freight.limit(10))


# In[5]:


df_freight = df_freight.drop("WeightCubic")
df_freight = df_freight.withColumn("RevenuePerKg", df_freight["Revenue"] / df_freight["WeightKg"]) \
                        .withColumn("GoodsValuePerKg", df_freight["GoodsValue"] / df_freight["WeightKg"])
display(df_freight.limit(5))


# In[7]:


df_costs = spark.read.table("LH_Logistics.dbo_Costs")


# In[8]:


display(df_costs.limit(5))


# In[9]:


df_costs["TruckID", "DriverID", "KmTravelled", "LitersConsumption", "LitersPer100Km", "FuelCost", "MaintenanceCost", "FixedCost", "TotalCost", "LitersPer100Km"]


# In[13]:


df_freight = df_freight.drop("GoodsValue", "GoodsValuePerKg")
df_freight.write.mode("overwrite").option("overwriteSchema", "true").saveAsTable("LH_Logistics.dbo_Freight")
df_costs.write.mode("overwrite").saveAsTable("LH_Logistics.dbo_Costs")

