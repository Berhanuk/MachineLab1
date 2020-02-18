
#part 1

library(readr)
library(dplyr)
library(plyr)

Orders <- read_csv("C:/Users/aviia/Desktop/NYCDSA/Bootcamp/Job Prep/Machine_Learning_Lab/Machine_Learning_Lab/data/Orders.csv")
View(Orders)

# 1.
Orders$Profit = gsub('[$]', '', Orders$Profit)
Orders$Profit = gsub('[,]', '', Orders$Profit)
Orders$Profit = as.numeric(Orders$Profit)
class(Orders$Profit)
Orders$Profit

Orders$Sales
Orders$Sales = gsub('[$]', '', Orders$Sales)
Orders$Sales = gsub('[,]', '', Orders$Sales)
Orders$Sales = as.numeric(Orders$Sales)
class(Orders$Sales)
Orders$Sales

# 2.
Orders$Order.Date <- as.Date(Orders$Order.Date,
                               format = "%m/%d/%y")
Orders$Order.Date = as.Date(Orders$Order.Date)
class(Orders$Order.Date)
Orders$Order.Date
# say something here
# View(DateQ$Quantity)
# View(DateQ$Order.Date)

View(Orders)

DateQ = Orders %>%
  group_by(Order.Date,Category) %>%
  summarize(Quantity = sum(Quantity))

DateQ

ggplot(data = DateQ, aes(x = Order.Date, y = Quantity)) + geom_smooth(aes(color=Category))

# 3.1
Returns <- read_csv("C:/Users/aviia/Desktop/NYCDSA/Bootcamp/Job Prep/Machine_Learning_Lab/Machine_Learning_Lab/data/Returns.csv")
View(Returns)

Returns = rename(Returns, c("Order ID" = "Order.ID"))
Returns
Orders

OR = merge(Orders, Returns, by = 'Order.ID')
View(OR)
sum(OR$Profit)

# 3.2
CR = as.data.frame((table(OR$Customer.ID)))
View(CR)
CR1 = CR %>% filter(Freq>1)
View(CR1)
CR2 = CR %>% filter(Freq>5)
View(CR2)

# 3.3
RR = as.data.frame((table(OR$Region.y)))
View(RR)

# 3.4
as.data.frame((table(OR$Sub.Category)))
as.data.frame((table(OR$Category)))

# Part 2
