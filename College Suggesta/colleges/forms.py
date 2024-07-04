from django import forms


# creating a form

region_choices =(
    ("AU", "AU"),
    ("SVU", "SVU"),
)

gender_choices = (
    ("Male", "Male"),
    ("Female", "Female"),
    ("Other", "Other"),
)

caste_choices = (
    ("sc", "SC"),
    ("st", "ST"),
    ("bc_a", "BC - A"),
    ("bc_b", "BC - B"),
    ("bc_c", "BC - C"),
    ("bc_d", "BC - D"),
    ("bc_e", "BC - E"),
    ("oc", "OC"),
)

branch_choices = (
    ("ECE", "ECE"),
    ("CSE", "CSE"),
    ("EEE", "EEE"),
    ("CIVIL", "CIVIL"),
    ("CHEMICAL", "CHEMICAL"),
    ("MECH", "MECH"),
    ("IT", "IT"),
)

order_choice = (
    ("name", "College Name"),
    ("placements", "placements"),
    ("placement_ratio", "placements ratio"),
    ("nirf_ranking", "Nirf Ranking"),
    ("infra", "Infrastructure"),
    ("college_fee", "College Fee"),
    ("nba_accredit", "NBA Accrediation"),
)

class StudentInputForm(forms.Form):
    rank = forms.IntegerField(required=True)
    region = forms.ChoiceField(choices = region_choices)
    gender = forms.ChoiceField(choices = gender_choices, widget=forms.RadioSelect)
    caste = forms.ChoiceField(choices = caste_choices, widget=forms.RadioSelect)
    branch = forms.ChoiceField(choices=branch_choices)
    order_by = forms.MultipleChoiceField(choices = order_choice)
