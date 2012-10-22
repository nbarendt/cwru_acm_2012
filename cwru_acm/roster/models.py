from django.db import models
from django.core.validators import RegexValidator

# Create your models here.

class Instructor(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)

    def __unicode__(self):
        return u'%s, %s' % (self.last_name, self.first_name)

class Department(models.Model):
    name = models.CharField(max_length=100)
    shortname = models.CharField(max_length=4,
        unique=True,
        validators=[
            RegexValidator(regex=r'^[A-Z]{4}$',
                message="Enter a four character string")
        ])
    def __unicode__(self):
        return u'%s' % self.shortname

class Student(models.Model):
    first_name = models.CharField(max_length=100)
    last_name= models.CharField(max_length=100)

    def __unicode__(self):
        return u'%s, %s' % (self.last_name, self.first_name)

class Course(models.Model):
    department = models.ForeignKey(Department)
    # force course number to be a three-digit string
    number = models.CharField(max_length=3,
        validators=[
            RegexValidator(regex=r'^\d{3}$',
                message="Enter a three-digit value")
        ])
    description = models.CharField(max_length=1000)
    instructor = models.ForeignKey(Instructor)
    students = models.ManyToManyField(Student)

    def __unicode__(self):
        return u'%s %s' % (self.department.shortname, self.number)
    

