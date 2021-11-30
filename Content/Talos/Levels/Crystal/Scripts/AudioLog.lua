SIGSTRM12GIS             �i[�                  Signkey.EditorSignaturey84*�GP\�g&���
�ڗ;�	�Z��'�I�Y���3�#��L��\)>H�`�<��n�`p���i��6k?���;P��"4��Y��2v)U �@����ƍ@�v��x�T=�|�1�s�Gf�J���pCq.���Dw�����ω�\p�z�P�&��#���.p��M��ʖz���Y�Y���B
��I��C_�1շ�G� ���h5�{�|��	�%�
-{�J��;���'C#�h�=�6"�%﻿-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

local function HideAudioLog()
  chair:Disappear()
  detector:Deactivate()
  Wait(Delay(0.1))
  soundGlitch:StopLoopingFadeOut(1)
  particlesGlitch:Terminate()
  lightGlitch:Deactivate()
end

local function ShowAudioLog()
  detector:EnableTouchAutoMoveTarget(true)
  chair:Appear()
  soundGlitch:PlayLooping()
  particlesGlitch:Start()
  lightGlitch:Activate()
end

local str = soundGlitch:GetName()
if talosProgress:IsVarSet(str) then
  HideAudioLog()
else
  ShowAudioLog()
  Wait(Event(detector.Activated))
  HideAudioLog()
  talosProgress:SetVar(str)
  prjBackupAndSaveGameProgress(worldInfo)
end
`�j�������{6oC�����/�z�x:^{s����+��M���R� �f����|=S��iB��ڧ����鵫"Qs�����)�-��1a�������u��P���
�M���!�k~�>I5«wMB��=\q���`:?�d���,�Yk��{k�7��}��-�E�hv�:5ۭ�?��� �P(>�bF��)RԲ�g�2*����
�%��&��	%���סu�����ȟ����5M1�l!