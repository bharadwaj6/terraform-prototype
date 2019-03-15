# resource "aws_security_group" "dbcitizen" {
#     name = "vpc_dbcitizen"
#     description = "A database citizen"

#     vpc_id = "${aws_vpc.default.id}"

#     tags {
#         Name = "Database Citizen"
#     }

# }

# resource "aws_security_group" "appcitizen" {
#     name = "vpc_appcitizen"
#     description = "An app citizen"

#     vpc_id = "${aws_vpc.default.id}"

#     tags {
#         Name = "App server Citizen"
#     }
# }

# resource "aws_security_group" "webcitizen" {
#     name = "vpc_webcitizen"
#     description = "A web citizen"

#     vpc_id = "${aws_vpc.default.id}"

#     tags {
#         Name = "Web Citizen"
#     }
# }

# resource "aws_security_group" "vettedcitizen" {
#     name = "vpc_vettedcitizen"
#     description = "A vetted citizen"

#     vpc_id = "${aws_vpc.default.id}"

#     tags {
#         Name = "Vetted Citizen"
#     }
# }