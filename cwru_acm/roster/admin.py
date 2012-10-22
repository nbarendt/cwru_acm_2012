from django.contrib import admin
from roster.models import Student
from roster.models import Instructor
from roster.models import Department
from roster.models import Course

admin.site.register(Student)
admin.site.register(Instructor)
admin.site.register(Department)
admin.site.register(Course)
