from django.db import models

# Create your models here.


class College(models.Model):
    code = models.CharField(max_length=15)
    name = models.CharField(max_length=250)
    region = models.CharField(max_length=250)
    district = models.CharField(max_length=250)
    Place = models.CharField(max_length=250)
    affl_university = models.CharField(max_length=250)
    established_year = models.IntegerField()
    branch_code = models.CharField(max_length=250)
    placements = models.IntegerField()
    placement_ratio = models.FloatField()
    branch_placements = models.IntegerField()
    college_fee = models.FloatField()
    infra = models.IntegerField()
    nirf_ranking = models.IntegerField()
    nba_accredit = models.BooleanField(default=False)
    hostel = models.CharField(max_length=250)
    avg_sal = models.FloatField()
    high_sal = models.FloatField()
    top_comanies = models.CharField(max_length=500)
    college_website = models.TextField()
    oc_boys_rank = models.IntegerField()
    oc_girls_rank = models.IntegerField()
    sc_boys_rank = models.IntegerField()
    sc_girls_rank = models.IntegerField()
    st_boys_rank = models.IntegerField()
    st_girls_rank = models.IntegerField()
    bc_a_boys_rank = models.IntegerField()
    bc_b_boys_rank = models.IntegerField()
    bc_c_boys_rank = models.IntegerField()
    bc_d_boys_rank = models.IntegerField()
    bc_e_boys_rank = models.IntegerField()
    bc_a_girls_rank = models.IntegerField()
    bc_b_girls_rank = models.IntegerField()
    bc_c_girls_rank = models.IntegerField()
    bc_d_girls_rank = models.IntegerField()
    bc_e_girls_rank = models.IntegerField()


    def __str__(self):
        return self.name