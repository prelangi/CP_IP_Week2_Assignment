/*
Given n points on a 2D plane, find the maximum number of points that lie on the same straight line.

Sample Input :

(1, 1)
(2, 2)
Sample Output :

2
You will be give 2 arrays X and Y. Each point is represented by (X[i], Y[i])
*/

int Solution::maxPoints(vector<int> &A, vector<int> &B) {
    // Do not write main() function.
    // Do not read input, instead use the arguments to the function.
    // Do not print the output, instead return values as specified
    // Still have a doubt. Checkout www.interviewbit.com/pages/sample_codes/ for more details

    int N = A.size();
    if (N < 2)
        return N;
 
    int maxPoint = 0;
    int curMax, overlapPoints, verticalPoints;
 
    // map to store slope pair
    map<pair<int, int>, int> slopeMap;
 
    //  looping for each point
    for (int i = 0; i < N; i++)
    {
        curMax = overlapPoints = verticalPoints = 0;
 
        //  looping from i + 1 to ignore same pair again
        for (int j = i + 1; j < N; j++)
        {
            //  If both point are equal then just
            // increase overlapPoint count
            if ((A[i] == A[j]) && (B[i] == B[j]))
                    overlapPoints++;
                // If x co-ordinate is same, then both
                // point are vertical to each other
            else if (A[i] == A[j])
                    verticalPoints++;
                else
                {
                    int yDif = B[j] - B[i];
                    int xDif = A[j] - A[i];
                    int g = __gcd(xDif, yDif);
 
                    // reducing the difference by their gcd
                    yDif /= g;
                    xDif /= g;
 
                    // increasing the frequency of current slope
                    // in map
                    //cout << "Incrementing hash value for (" << yDif << ", " << xDif << endl;
                    slopeMap[make_pair(yDif, xDif)]++;
                    curMax = max(curMax, slopeMap[make_pair(yDif, xDif)]);
                    //cout << "currmax: " << curMax << endl;
                }
 
                //cout << "currmax: " << curMax << "verticalPoints: " << verticalPoints << endl;
                curMax = max(curMax, verticalPoints);
            }
            
            //cout << "overlapPoints: " << overlapPoints << endl;
            // updating global maximum by current point's maximum
            maxPoint = max(maxPoint, curMax + overlapPoints + 1);
 
            // printf("maximum colinear point which contains current
            // point are : %d\n", curMax + overlapPoints + 1);
            slopeMap.clear();
        }
 
        return maxPoint;
    
    
    
}
