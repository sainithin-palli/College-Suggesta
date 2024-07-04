from rest_framework import generics
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework import status
from django.views.generic import ListView
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt
from colleges.models import College
from .serializers import CollegeSerializer
from .forms import StudentInputForm


# class CollegeListAPIView(generics.ListCreateAPIView):
#     queryset = College.objects.all()
#     serializer_class = CollegeSerializer
@api_view(['GET', 'POST'])
def CollegeListAPIDataView(request,rank,region,caste,gender,branch,placement):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'GET':
        print("uri is",request.get_full_path())
        fields=tuple([i for i in placement.split('-') if i!='null'])
        print('length ',len(fields),fields)
        #rank,region,sc,placement
        # colleges = College.objects.filter(sc_boys_rank__gte=rank).order_by(
        #    str('-') + str(*fields))
        # ----------------------------------------------------------------------------------------------

        # print(region, rank, caste, sort_field)
        # gender_typ =
        if gender == "Male":
            caste_and_rank = caste + '_' + "boys"
        else:
            caste_and_rank = caste + '_' + "girls"
        caste_and_rank_with_tag = caste_and_rank + '_' + "rank" + '__gte'
        print("caste", caste_and_rank_with_tag)

        filter_fields = {
            "region": region,
            "branch_code": branch,
            caste_and_rank_with_tag: rank
        }
        if len(fields) >= 2:
            print("enter 1")
            # fields = tuple(fields)
            if "nirf_ranking" in fields and "placements" in fields:
                print("enter 2")
                colleges = College.objects.filter(**filter_fields).order_by(
                    '-placements','nirf_ranking','college_fee')
            elif "nirf_ranking" in fields:
                print("enter 3")
                colleges = College.objects.filter(**filter_fields).order_by(
                    'nirf_ranking',*fields)
            elif "placements" in fields:
                colleges = College.objects.filter(**filter_fields).order_by(
                    '-placements',*fields)
            else:
                colleges = College.objects.filter(**filter_fields).order_by(
                    *fields[0:-1])
            if caste == "SC":
                colleges = College.objects.filter(region=region, gender=gender, sc_boys_rank__gte=rank).order_by(
                    *fields)
            if caste == "ST":
                colleges = College.objects.filter(region=region, gender=gender, st_boys_rank__gte=rank).order_by(
                    *fields)
            if caste == "BC":
                colleges = College.objects.filter(region=region, gender=gender, bc_boys_rank__gte=rank).order_by(
                    *fields)
            if caste == "OC":
                colleges = College.objects.filter(region=region, gender=gender, oc_boys_rank__gte=rank).order_by(
                    *fields)
        else:
            if "nirf_ranking" in fields or "college_fee" in fields:
                colleges = College.objects.filter(**filter_fields).order_by(str(*fields))
            else:
                colleges = College.objects.filter(**filter_fields).order_by(
                    str('-') + str(*fields))
            if caste == "SC":
                colleges = College.objects.filter(region=region, gender=gender, sc_boys_rank__gte=rank).order_by(
                    str('-') + str(*fields))
            if caste == "ST":
                colleges = College.objects.filter(region=region, gender=gender, st_boys_rank__gte=rank).order_by(
                    str('-') + str(*fields))
            if caste == "BC":
                colleges = College.objects.filter(region=region, gender=gender, bc_boys_rank__gte=rank).order_by(
                    str('-') + str(*fields))
            if caste == "OC":
                colleges = College.objects.filter(region=region, gender=gender, oc_boys_rank__gte=rank).order_by(
                    str('-') + str(*fields))
        # snippets = College.objects.filter(id__gte=pk).order_by(str('-') + str(*fields))
        # colleges = College.objects.filter(st_boys_rank__gte=rank)
        # ----------------------------------------------------------------------------------------------

        serializer = CollegeSerializer(colleges, many=True)
        return Response(serializer.data)





@api_view(['GET', 'POST'])
@permission_classes([AllowAny,])
@csrf_exempt
def CollegeListAPIView(request):
    """
    List all code snippets, or create a new snippet.
    """

    if request.method == 'GET':
        fields = ("code",)
        pk=1
        snippets = College.objects.filter(id__gte=pk).order_by(str('-')+str(*fields)) #cooment

        snippets = College.objects.all()
        serializer = CollegeSerializer(snippets, many=True)
        return Response(serializer.data)

    elif request.method == 'POST':
        rank = request.POST["rank"]


        data_form = StudentInputForm(request.POST) #comment 52-113
        if data_form.is_valid():
            region = data_form.cleaned_data['region']
            gender = data_form.cleaned_data['gender']
            rank = data_form.cleaned_data['rank']
            caste = data_form.cleaned_data['caste']
            branch = data_form.cleaned_data['branch']
            sort_field = data_form.cleaned_data['order_by']
            # print(region, rank, caste, sort_field)
            # gender_typ =
            if gender == "Male":
                caste_and_rank = caste + '_' + "boys"
            else:
                caste_and_rank = caste + '_' + "girls"
            caste_and_rank_with_tag = caste_and_rank + '_' + "rank" + '__gte'
            print("caste", caste_and_rank_with_tag)

            fields = tuple(sort_field)
            filter_fields = {
                "region": region,
                "branch_code" : branch,
                caste_and_rank_with_tag: rank
            }
            if len(sort_field) >= 2:
                fields = tuple(sort_field)
                if "nirf_ranking" in fields or "college_fee" in fields:
                    colleges = College.objects.filter(**filter_fields).order_by(
                        *fields)
                else:
                    colleges = College.objects.filter(**filter_fields).order_by(
                        *fields[0:-1])
                if caste == "SC":
                    colleges = College.objects.filter(region=region, gender=gender, sc_boys_rank__gte=rank).order_by(
                        *fields)
                if caste == "ST":
                    colleges = College.objects.filter(region=region, gender=gender, st_boys_rank__gte=rank).order_by(
                        *fields)
                if caste == "BC":
                    colleges = College.objects.filter(region=region, gender=gender, bc_boys_rank__gte=rank).order_by(
                        *fields)
                if caste == "OC":
                    colleges = College.objects.filter(region=region, gender=gender, oc_boys_rank__gte=rank).order_by(
                        *fields)
            else:
                if "nirf_ranking" in fields or "college_fee" in fields:
                    colleges = College.objects.filter(**filter_fields).order_by( str(*fields))
                else:
                    colleges = College.objects.filter(**filter_fields).order_by(
                    str('-') + str(*fields))
                if caste == "SC":
                    colleges = College.objects.filter(region=region, gender=gender, sc_boys_rank__gte=rank).order_by(
                        str('-') + str(*fields))
                if caste == "ST":
                    colleges = College.objects.filter(region=region, gender=gender, st_boys_rank__gte=rank).order_by(
                        str('-') + str(*fields))
                if caste == "BC":
                    colleges = College.objects.filter(region=region, gender=gender, bc_boys_rank__gte=rank).order_by(
                        str('-') + str(*fields))
                if caste == "OC":
                    colleges = College.objects.filter(region=region, gender=gender, oc_boys_rank__gte=rank).order_by(
                        str('-') + str(*fields))
        # snippets = College.objects.filter(id__gte=pk).order_by(str('-') + str(*fields))
        colleges = College.objects.filter(st_boys_rank__gte=rank)

        serializer = CollegeSerializer(colleges, many=True)
        return Response(serializer.data)



class CollegeDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = College.objects.all()
    serializer_class = CollegeSerializer

def all_colleges(request):

    context = {'object_list': College.objects.all()}

    return render(request, 'colleges/college_list.html', context)


def student_input(request):

    # context = {}
    # form = StudentInputForm()
    #
    # context['form'] = form
    # return render(request, "colleges/student_input.html", context)
    return render(request, "colleges/student_input.html")



